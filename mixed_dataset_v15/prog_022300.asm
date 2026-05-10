; DESCRIPTION: Places a cyan disk with center (252, 55) and radius 29.
; PLAN: r0=252(x), r1=55(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 252
LDI r1, 55
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
