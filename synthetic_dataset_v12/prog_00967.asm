; DESCRIPTION: Draws a cyan circle centered at (416, 208) with radius 22.
; PLAN: r0=416(x), r1=208(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 416
LDI r1, 208
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
