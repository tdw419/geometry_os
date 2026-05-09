; DESCRIPTION: Places a blue dot at position (277, 224).
; PLAN: r0=277(x), r1=224(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 277
LDI r1, 224
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
