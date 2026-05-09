; DESCRIPTION: Places a orange dot at position (502, 8).
; PLAN: r0=502(x), r1=8(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 502
LDI r1, 8
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
