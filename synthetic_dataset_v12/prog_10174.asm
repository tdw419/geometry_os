; DESCRIPTION: Creates a cyan circular shape at (375, 133) with radius 59.
; PLAN: r0=375(x), r1=133(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 375
LDI r1, 133
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
