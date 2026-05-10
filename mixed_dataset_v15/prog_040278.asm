; DESCRIPTION: Places a yellow dot at position (464, 187).
; PLAN: r0=464(x), r1=187(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 464
LDI r1, 187
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
