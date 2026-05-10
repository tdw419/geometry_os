; DESCRIPTION: Composite: Places a black line segment connecting (456, 65) to (31, 69) then Renders a purple box of size 101x53 starting at (395, 38).
; PLAN: r0=456(x1), r1=65(y1), r2=31(x2), r3=69(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=395(x), r6=38(y), r7=101(width), r8=53(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 456
LDI r1, 65
LDI r2, 31
LDI r3, 69
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 38
LDI r7, 101
LDI r8, 53
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
