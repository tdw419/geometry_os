; DESCRIPTION: Places a green dot at position (16, 142).
; PLAN: r0=16(x), r1=142(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 16
LDI r1, 142
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
