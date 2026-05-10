; DESCRIPTION: Composite: Places a cyan line segment connecting (191, 60) to (194, 94) then Places a purple 16x34 rectangle at position (278, 68).
; PLAN: r0=191(x1), r1=60(y1), r2=194(x2), r3=94(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=278(x), r6=68(y), r7=16(width), r8=34(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 191
LDI r1, 60
LDI r2, 194
LDI r3, 94
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 68
LDI r7, 16
LDI r8, 34
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
