; DESCRIPTION: Creates a vertical cyan gradient from black to cyan.
; PLAN: r0=4(x), r1=7(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 4
LDI r1, 7
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
