; DESCRIPTION: Places a cyan circle of radius 66 at center (313, 178).
; PLAN: r0=313(x), r1=178(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 313
LDI r1, 178
LDI r2, 66
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
