; DESCRIPTION: Places a green dot at position (113, 6).
; PLAN: r0=113(x), r1=6(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 113
LDI r1, 6
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
