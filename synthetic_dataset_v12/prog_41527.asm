; DESCRIPTION: Places a red dot at position (261, 146).
; PLAN: r0=261(x), r1=146(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 261
LDI r1, 146
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
