; DESCRIPTION: Places a white circle of radius 68 at center (135, 176).
; PLAN: r0=135(x), r1=176(y), r2=68(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 176
LDI r2, 68
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
