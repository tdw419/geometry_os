; DESCRIPTION: Draws a cyan circle centered at (435, 121) with radius 54.
; PLAN: r0=435(x), r1=121(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 435
LDI r1, 121
LDI r2, 54
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
