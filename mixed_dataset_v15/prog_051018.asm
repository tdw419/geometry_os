; DESCRIPTION: Places a green dot at position (372, 52).
; PLAN: r0=372(x), r1=52(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 372
LDI r1, 52
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
