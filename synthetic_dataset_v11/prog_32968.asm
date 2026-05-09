; DESCRIPTION: Places a green dot at position (34, 38).
; PLAN: r0=34(x), r1=38(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 34
LDI r1, 38
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
