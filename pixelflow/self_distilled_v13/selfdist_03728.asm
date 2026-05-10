; DESCRIPTION: Draws a cyan circle centered at (50, 173) with radius 29.
; PLAN: r0=50(x), r1=173(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 50
LDI r1, 173
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
