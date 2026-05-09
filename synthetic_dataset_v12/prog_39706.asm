; DESCRIPTION: Places a cyan circle of radius 13 at center (57, 92).
; PLAN: r0=57(x), r1=92(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 57
LDI r1, 92
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
