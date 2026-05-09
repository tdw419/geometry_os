; DESCRIPTION: Places a orange dot at position (262, 59).
; PLAN: r0=262(x), r1=59(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 262
LDI r1, 59
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
