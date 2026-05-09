; DESCRIPTION: Places a green dot at position (67, 167).
; PLAN: r0=67(x), r1=167(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 67
LDI r1, 167
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
