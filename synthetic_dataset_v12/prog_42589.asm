; DESCRIPTION: Draws a cyan circle centered at (258, 146) with radius 32.
; PLAN: r0=258(x), r1=146(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 258
LDI r1, 146
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
