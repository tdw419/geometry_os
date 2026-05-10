; DESCRIPTION: Places a orange dot at position (210, 197).
; PLAN: r0=210(x), r1=197(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 210
LDI r1, 197
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
