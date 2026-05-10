; DESCRIPTION: Places a green dot at position (121, 183).
; PLAN: r0=121(x), r1=183(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 121
LDI r1, 183
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
