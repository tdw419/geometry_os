; DESCRIPTION: Creates a cyan circular shape at (70, 120) with radius 65.
; PLAN: r0=70(x), r1=120(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 120
LDI r2, 65
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
