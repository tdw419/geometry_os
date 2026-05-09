; DESCRIPTION: Places a red circle of radius 42 at center (80, 119).
; PLAN: r0=80(x), r1=119(y), r2=42(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 119
LDI r2, 42
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
