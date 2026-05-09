; DESCRIPTION: Places a blue circle of radius 46 at center (189, 154).
; PLAN: r0=189(x), r1=154(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 154
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
