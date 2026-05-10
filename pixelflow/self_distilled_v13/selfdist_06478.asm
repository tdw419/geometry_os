; DESCRIPTION: Draws concentric green circles at the center with radii 20, 40, 60.
; PLAN: r0=10(x), r1=50(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 10
LDI r1, 50
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
