; DESCRIPTION: Creates a cyan circular shape at (59, 107) with radius 55.
; PLAN: r0=59(x), r1=107(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 107
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
