; DESCRIPTION: Places a yellow dot at position (244, 33).
; PLAN: r0=244(x), r1=33(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 244
LDI r1, 33
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
