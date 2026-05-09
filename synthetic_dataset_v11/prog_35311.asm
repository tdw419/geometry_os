; DESCRIPTION: Creates a cyan circular shape at (106, 152) with radius 46.
; PLAN: r0=106(x), r1=152(y), r2=46(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 152
LDI r2, 46
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
