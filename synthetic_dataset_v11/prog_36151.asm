; DESCRIPTION: Places a yellow dot at position (117, 134).
; PLAN: r0=117(x), r1=134(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 117
LDI r1, 134
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
