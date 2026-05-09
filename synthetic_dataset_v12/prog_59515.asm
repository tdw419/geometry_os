; DESCRIPTION: Places a orange dot at position (213, 166).
; PLAN: r0=213(x), r1=166(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 213
LDI r1, 166
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
