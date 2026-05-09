; DESCRIPTION: Places a green dot at position (263, 22).
; PLAN: r0=263(x), r1=22(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 263
LDI r1, 22
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
