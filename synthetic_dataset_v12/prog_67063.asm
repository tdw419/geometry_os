; DESCRIPTION: Renders a red box of size 51x85 starting at (373, 130).
; PLAN: r0=373(x), r1=130(y), r2=51(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 130
LDI r2, 51
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
