; DESCRIPTION: Creates a vertical cyan gradient from black to cyan.
; PLAN: r0=1(x), r1=3(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 1
LDI r1, 3
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
