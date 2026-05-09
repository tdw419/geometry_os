; DESCRIPTION: Creates a cyan circular shape at (170, 90) with radius 70.
; PLAN: r0=170(x), r1=90(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 90
LDI r2, 70
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
