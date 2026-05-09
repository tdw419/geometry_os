; DESCRIPTION: Draws a cyan circle centered at (215, 161) with radius 32.
; PLAN: r0=215(x), r1=161(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 161
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
