; DESCRIPTION: Places a yellow circle of radius 65 at center (243, 107).
; PLAN: r0=243(x), r1=107(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 243
LDI r1, 107
LDI r2, 65
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
