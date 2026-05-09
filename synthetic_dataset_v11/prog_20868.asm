; DESCRIPTION: Places a green dot at position (240, 212).
; PLAN: r0=240(x), r1=212(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 240
LDI r1, 212
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
