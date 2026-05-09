; DESCRIPTION: Places a cyan circle of radius 66 at center (116, 154).
; PLAN: r0=116(x), r1=154(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 154
LDI r2, 66
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
