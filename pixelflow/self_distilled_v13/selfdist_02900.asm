; DESCRIPTION: Creates a vertical cyan gradient from black to cyan.
; PLAN: r0=3(x), r1=3(y), r2=1(x2), r3=9(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 3
LDI r2, 1
LDI r3, 9
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
