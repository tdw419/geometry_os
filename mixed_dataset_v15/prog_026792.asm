; DESCRIPTION: Draws a cyan circle centered at (243, 138) with radius 74.
; PLAN: r0=243(x), r1=138(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 243
LDI r1, 138
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
