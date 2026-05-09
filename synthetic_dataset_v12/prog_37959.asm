; DESCRIPTION: Places a cyan circle of radius 67 at center (175, 67).
; PLAN: r0=175(x), r1=67(y), r2=67(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 67
LDI r2, 67
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
