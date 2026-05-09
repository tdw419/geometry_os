; DESCRIPTION: Places a green dot at position (120, 21).
; PLAN: r0=120(x), r1=21(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 120
LDI r1, 21
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
