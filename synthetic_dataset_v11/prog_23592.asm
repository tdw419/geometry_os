; DESCRIPTION: Draws a cyan circle centered at (176, 126) with radius 20.
; PLAN: r0=176(x), r1=126(y), r2=20(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 126
LDI r2, 20
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
