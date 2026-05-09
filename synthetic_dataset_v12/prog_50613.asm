; DESCRIPTION: Places a blue dot at position (503, 202).
; PLAN: r0=503(x), r1=202(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 503
LDI r1, 202
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
