; DESCRIPTION: Renders a orange disk with center (156, 187) and radius 46.
; PLAN: r0=156(x), r1=187(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 187
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
