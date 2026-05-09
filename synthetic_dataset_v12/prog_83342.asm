; DESCRIPTION: Places a black circle of radius 77 at center (406, 154).
; PLAN: r0=406(x), r1=154(y), r2=77(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 406
LDI r1, 154
LDI r2, 77
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
