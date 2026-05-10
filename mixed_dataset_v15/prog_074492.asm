; DESCRIPTION: Places a red circle of radius 55 at center (224, 180).
; PLAN: r0=224(x), r1=180(y), r2=55(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 180
LDI r2, 55
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
