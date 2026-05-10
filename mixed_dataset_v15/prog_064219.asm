; DESCRIPTION: Places a yellow dot at position (16, 164).
; PLAN: r0=16(x), r1=164(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 16
LDI r1, 164
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
