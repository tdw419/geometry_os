; DESCRIPTION: Places a red dot at position (393, 173).
; PLAN: r0=393(x), r1=173(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 393
LDI r1, 173
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
