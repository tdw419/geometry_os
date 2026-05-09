; DESCRIPTION: Renders a yellow disk with center (174, 187) and radius 66.
; PLAN: r0=174(x), r1=187(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 187
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
