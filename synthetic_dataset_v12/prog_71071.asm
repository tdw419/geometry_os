; DESCRIPTION: Places a yellow dot at position (416, 200).
; PLAN: r0=416(x), r1=200(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 416
LDI r1, 200
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
