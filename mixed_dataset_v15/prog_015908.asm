; DESCRIPTION: Draws a cyan circle centered at (488, 136) with radius 16.
; PLAN: r0=488(x), r1=136(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 488
LDI r1, 136
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
