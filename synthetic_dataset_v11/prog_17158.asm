; DESCRIPTION: Composite: . Then Renders a red disk with center (144, 81) and radius 64. Then Draws a red line from (5, 224) to (3, 218).
; PLAN: r0=144(x), r1=81(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=5(x1), r1=224(y1), r2=3(x2), r3=218(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a red disk with center (144, 81) and radius 64.
; PLAN: r0=144(x), r1=81(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 81
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a red line from (5, 224) to (3, 218).
; PLAN: r0=5(x1), r1=224(y1), r2=3(x2), r3=218(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 224
LDI r2, 3
LDI r3, 218
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
