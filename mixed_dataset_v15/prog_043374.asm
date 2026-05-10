; DESCRIPTION: Draws a cyan circle centered at (220, 70) with radius 36.
; PLAN: r0=220(x), r1=70(y), r2=36(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 70
LDI r2, 36
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
