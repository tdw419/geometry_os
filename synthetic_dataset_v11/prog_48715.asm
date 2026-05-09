; DESCRIPTION: Composite: . Then Renders a blue disk with center (167, 182) and radius 62. Then Draws a red line from (126, 219) to (42, 170).
; PLAN: r0=167(x), r1=182(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=126(x1), r1=219(y1), r2=42(x2), r3=170(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue disk with center (167, 182) and radius 62.
; PLAN: r0=167(x), r1=182(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 182
LDI r2, 62
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a red line from (126, 219) to (42, 170).
; PLAN: r0=126(x1), r1=219(y1), r2=42(x2), r3=170(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 219
LDI r2, 42
LDI r3, 170
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
