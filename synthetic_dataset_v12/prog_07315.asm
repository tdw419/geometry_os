; DESCRIPTION: Draws a cyan circle centered at (173, 125) with radius 20.
; PLAN: r0=173(x), r1=125(y), r2=20(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 125
LDI r2, 20
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
