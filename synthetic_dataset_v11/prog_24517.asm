; DESCRIPTION: Renders a red disk with center (60, 55) and radius 50.
; PLAN: r0=60(x), r1=55(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 55
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
