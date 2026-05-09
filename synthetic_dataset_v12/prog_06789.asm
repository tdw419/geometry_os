; DESCRIPTION: Composite: Renders a purple line between points (87, 131) and (345, 139) then Renders a white box of size 23x55 starting at (65, 69).
; PLAN: r0=87(x1), r1=131(y1), r2=345(x2), r3=139(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=65(x), r6=69(y), r7=23(width), r8=55(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 87
LDI r1, 131
LDI r2, 345
LDI r3, 139
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 69
LDI r7, 23
LDI r8, 55
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
