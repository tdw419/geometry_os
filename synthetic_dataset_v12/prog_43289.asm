; DESCRIPTION: Creates a purple circular shape at (281, 149) with radius 72.
; PLAN: r0=281(x), r1=149(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 281
LDI r1, 149
LDI r2, 72
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
