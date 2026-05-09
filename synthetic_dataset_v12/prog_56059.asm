; DESCRIPTION: Places a red dot at position (464, 173).
; PLAN: r0=464(x), r1=173(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 464
LDI r1, 173
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
