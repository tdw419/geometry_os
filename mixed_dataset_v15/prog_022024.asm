; DESCRIPTION: Places a green dot at position (428, 212).
; PLAN: r0=428(x), r1=212(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 428
LDI r1, 212
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
