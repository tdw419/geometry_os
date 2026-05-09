; DESCRIPTION: Places a cyan circle of radius 67 at center (191, 79).
; PLAN: r0=191(x), r1=79(y), r2=67(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 79
LDI r2, 67
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
