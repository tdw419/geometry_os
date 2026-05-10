; DESCRIPTION: Composite: Places a purple circle of radius 46 at center (99, 146) then Renders a white box of size 89x51 starting at (37, 190).
; PLAN: r0=99(x), r1=146(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=37(x), r6=190(y), r7=89(width), r8=51(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 99
LDI r1, 146
LDI r2, 46
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 37
LDI r6, 190
LDI r7, 89
LDI r8, 51
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
