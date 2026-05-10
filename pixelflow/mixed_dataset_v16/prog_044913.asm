; DESCRIPTION: Places a green dot at position (218, 74).
; PLAN: r0=218(x), r1=74(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 218
LDI r1, 74
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
