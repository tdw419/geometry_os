; DESCRIPTION: Draws a cyan circle centered at (81, 150) with radius 50.
; PLAN: r0=81(x), r1=150(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 150
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
