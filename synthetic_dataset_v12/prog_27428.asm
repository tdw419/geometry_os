; DESCRIPTION: Renders a cyan disk with center (431, 127) and radius 54.
; PLAN: r0=431(x), r1=127(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 431
LDI r1, 127
LDI r2, 54
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
