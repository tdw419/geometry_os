; DESCRIPTION: Places a green dot at position (340, 84).
; PLAN: r0=340(x), r1=84(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 340
LDI r1, 84
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
