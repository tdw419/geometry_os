; DESCRIPTION: Places a white circle of radius 22 at center (106, 38).
; PLAN: r0=106(x), r1=38(y), r2=22(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 38
LDI r2, 22
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
