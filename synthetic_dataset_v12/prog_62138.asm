; DESCRIPTION: Places a cyan circle of radius 10 at center (116, 160).
; PLAN: r0=116(x), r1=160(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 160
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
