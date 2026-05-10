; DESCRIPTION: Creates a cyan circular shape at (295, 169) with radius 21.
; PLAN: r0=295(x), r1=169(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 295
LDI r1, 169
LDI r2, 21
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
