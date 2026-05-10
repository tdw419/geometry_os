; DESCRIPTION: Composite: Draws a purple line from (195, 140) to (410, 86) then Places a red 98x71 rectangle at position (38, 154).
; PLAN: r0=195(x1), r1=140(y1), r2=410(x2), r3=86(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=38(x), r6=154(y), r7=98(width), r8=71(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 195
LDI r1, 140
LDI r2, 410
LDI r3, 86
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 38
LDI r6, 154
LDI r7, 98
LDI r8, 71
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
