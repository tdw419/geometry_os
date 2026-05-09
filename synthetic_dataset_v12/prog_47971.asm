; DESCRIPTION: Places a cyan circle of radius 63 at center (423, 154).
; PLAN: r0=423(x), r1=154(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 423
LDI r1, 154
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
