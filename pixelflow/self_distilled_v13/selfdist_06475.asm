; DESCRIPTION: Places a green disk with center (352, 97) and radius 71.
; PLAN: r0=352(x), r1=97(y), r2=71(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 352
LDI r1, 97
LDI r2, 71
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
