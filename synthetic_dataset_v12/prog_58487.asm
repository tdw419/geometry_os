; DESCRIPTION: Places a green dot at position (291, 243).
; PLAN: r0=291(x), r1=243(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 291
LDI r1, 243
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
