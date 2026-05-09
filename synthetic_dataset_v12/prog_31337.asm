; DESCRIPTION: Places a blue dot at position (344, 188).
; PLAN: r0=344(x), r1=188(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 344
LDI r1, 188
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
