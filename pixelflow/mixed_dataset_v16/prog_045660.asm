; DESCRIPTION: Places a green dot at position (41, 196).
; PLAN: r0=41(x), r1=196(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 41
LDI r1, 196
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
