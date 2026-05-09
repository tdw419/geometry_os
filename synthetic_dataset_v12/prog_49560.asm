; DESCRIPTION: Places a green dot at position (398, 218).
; PLAN: r0=398(x), r1=218(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 398
LDI r1, 218
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
