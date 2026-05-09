; DESCRIPTION: Places a yellow circle of radius 38 at center (181, 154).
; PLAN: r0=181(x), r1=154(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 154
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
