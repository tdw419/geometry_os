; DESCRIPTION: Places a black circle of radius 16 at center (149, 154).
; PLAN: r0=149(x), r1=154(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 154
LDI r2, 16
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
