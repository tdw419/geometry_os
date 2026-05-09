; DESCRIPTION: Creates a purple circular shape at (281, 97) with radius 70.
; PLAN: r0=281(x), r1=97(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 281
LDI r1, 97
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
