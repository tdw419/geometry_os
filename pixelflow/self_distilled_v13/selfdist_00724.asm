; DESCRIPTION: Draws concentric orange circles at the center with radii 20, 40, 60.
; PLAN: r0=10(x), r1=40(y), r2=20(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 10
LDI r1, 40
LDI r2, 20
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
