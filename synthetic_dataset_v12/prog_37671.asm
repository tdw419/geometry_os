; DESCRIPTION: Draws a cyan circle centered at (316, 120) with radius 38.
; PLAN: r0=316(x), r1=120(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 316
LDI r1, 120
LDI r2, 38
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
