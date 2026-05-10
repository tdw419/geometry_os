; DESCRIPTION: Places a red dot at position (288, 215).
; PLAN: r0=288(x), r1=215(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 288
LDI r1, 215
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
