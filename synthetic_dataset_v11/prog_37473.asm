; DESCRIPTION: Places a cyan circle of radius 33 at center (74, 152).
; PLAN: r0=74(x), r1=152(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 152
LDI r2, 33
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
