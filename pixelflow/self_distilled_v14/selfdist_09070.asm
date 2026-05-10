; DESCRIPTION: Draws a cyan circle centered at (175, 42) with radius 80.
; PLAN: r0=175(x), r1=42(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 42
LDI r2, 80
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
