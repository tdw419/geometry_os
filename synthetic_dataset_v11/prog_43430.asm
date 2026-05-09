; DESCRIPTION: Draws a cyan circle centered at (154, 150) with radius 61.
; PLAN: r0=154(x), r1=150(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 150
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
