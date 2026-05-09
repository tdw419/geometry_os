; DESCRIPTION: Creates a cyan circular shape at (445, 29) with radius 17.
; PLAN: r0=445(x), r1=29(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 445
LDI r1, 29
LDI r2, 17
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
