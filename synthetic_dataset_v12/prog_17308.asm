; DESCRIPTION: Places a green dot at position (346, 155).
; PLAN: r0=346(x), r1=155(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 346
LDI r1, 155
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
