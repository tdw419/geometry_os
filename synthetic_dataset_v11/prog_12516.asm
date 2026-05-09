; DESCRIPTION: Renders a red disk with center (85, 126) and radius 50.
; PLAN: r0=85(x), r1=126(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 126
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
