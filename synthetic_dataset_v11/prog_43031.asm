; DESCRIPTION: Composite: . Then Places a black line segment connecting (3, 141) to (214, 190). Then Creates a blue circular shape at (52, 45) with radius 42.
; PLAN: r0=3(x1), r1=141(y1), r2=214(x2), r3=190(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=52(x), r1=45(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a black line segment connecting (3, 141) to (214, 190).
; PLAN: r0=3(x1), r1=141(y1), r2=214(x2), r3=190(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 141
LDI r2, 214
LDI r3, 190
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a blue circular shape at (52, 45) with radius 42.
; PLAN: r0=52(x), r1=45(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 52
LDI r1, 45
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
