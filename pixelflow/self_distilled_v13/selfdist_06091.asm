; DESCRIPTION: Places a green disk with center (295, 54) and radius 51.
; PLAN: r0=295(x), r1=54(y), r2=51(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 295
LDI r1, 54
LDI r2, 51
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
