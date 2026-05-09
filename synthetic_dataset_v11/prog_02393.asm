; DESCRIPTION: Places a green dot at position (167, 150).
; PLAN: r0=167(x), r1=150(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 167
LDI r1, 150
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
