; DESCRIPTION: Places a green dot at position (70, 34).
; PLAN: r0=70(x), r1=34(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 70
LDI r1, 34
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
