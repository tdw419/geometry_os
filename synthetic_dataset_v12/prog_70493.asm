; DESCRIPTION: Draws a cyan circle centered at (70, 152) with radius 56.
; PLAN: r0=70(x), r1=152(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 152
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
