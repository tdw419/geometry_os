; DESCRIPTION: Composite: Places a magenta 118x107 rectangle at position (193, 86) then Places a cyan line segment connecting (410, 206) to (335, 97).
; PLAN: r0=193(x), r1=86(y), r2=118(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=410(x1), r6=206(y1), r7=335(x2), r8=97(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 193
LDI r1, 86
LDI r2, 118
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 410
LDI r6, 206
LDI r7, 335
LDI r8, 97
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
