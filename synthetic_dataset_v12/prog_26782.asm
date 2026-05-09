; DESCRIPTION: Creates a cyan circular shape at (59, 95) with radius 53.
; PLAN: r0=59(x), r1=95(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 95
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
