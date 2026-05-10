; DESCRIPTION: Places a orange dot at position (368, 246).
; PLAN: r0=368(x), r1=246(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 368
LDI r1, 246
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
