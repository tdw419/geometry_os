; DESCRIPTION: Places a green dot at position (187, 220).
; PLAN: r0=187(x), r1=220(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 187
LDI r1, 220
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
