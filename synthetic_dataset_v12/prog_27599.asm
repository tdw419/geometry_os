; DESCRIPTION: Places a yellow circle of radius 41 at center (71, 154).
; PLAN: r0=71(x), r1=154(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 154
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
