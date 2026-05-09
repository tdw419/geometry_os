; DESCRIPTION: Places a green dot at position (265, 231).
; PLAN: r0=265(x), r1=231(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 265
LDI r1, 231
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
