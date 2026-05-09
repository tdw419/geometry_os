; DESCRIPTION: Places a cyan circle of radius 16 at center (123, 216).
; PLAN: r0=123(x), r1=216(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 216
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
