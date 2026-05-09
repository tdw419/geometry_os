; DESCRIPTION: Composite: Places a black 54x96 rectangle at position (227, 117) then Places a purple line segment connecting (207, 14) to (243, 190).
; PLAN: r0=227(x), r1=117(y), r2=54(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=207(x1), r6=14(y1), r7=243(x2), r8=190(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 227
LDI r1, 117
LDI r2, 54
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 14
LDI r7, 243
LDI r8, 190
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
