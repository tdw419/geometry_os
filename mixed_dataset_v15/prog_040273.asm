; DESCRIPTION: Places a red circle of radius 32 at center (210, 50).
; PLAN: r0=210(x), r1=50(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 50
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
