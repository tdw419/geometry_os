; DESCRIPTION: Creates a cyan circular shape at (152, 75) with radius 70.
; PLAN: r0=152(x), r1=75(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 75
LDI r2, 70
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
