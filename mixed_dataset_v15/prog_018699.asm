; DESCRIPTION: Places a black circle of radius 69 at center (178, 154).
; PLAN: r0=178(x), r1=154(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 154
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
