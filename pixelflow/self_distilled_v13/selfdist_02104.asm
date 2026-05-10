; DESCRIPTION: Creates a vertical cyan gradient from black to cyan.
; PLAN: r0=0(x), r1=1(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 0
LDI r1, 1
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
