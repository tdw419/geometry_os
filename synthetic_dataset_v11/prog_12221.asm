; DESCRIPTION: Places a green dot at position (243, 170).
; PLAN: r0=243(x), r1=170(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 243
LDI r1, 170
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
