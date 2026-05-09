; DESCRIPTION: Composite: . Then Places a red line segment connecting (216, 87) to (30, 33). Then Creates a red circular shape at (73, 126) with radius 50.
; PLAN: r0=216(x1), r1=87(y1), r2=30(x2), r3=33(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=73(x), r1=126(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red line segment connecting (216, 87) to (30, 33).
; PLAN: r0=216(x1), r1=87(y1), r2=30(x2), r3=33(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 87
LDI r2, 30
LDI r3, 33
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a red circular shape at (73, 126) with radius 50.
; PLAN: r0=73(x), r1=126(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 73
LDI r1, 126
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
