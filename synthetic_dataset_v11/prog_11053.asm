; DESCRIPTION: Places a yellow dot at position (255, 241).
; PLAN: r0=255(x), r1=241(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 255
LDI r1, 241
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
