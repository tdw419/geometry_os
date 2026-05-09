; DESCRIPTION: Draws a cyan circle centered at (193, 149) with radius 52.
; PLAN: r0=193(x), r1=149(y), r2=52(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 149
LDI r2, 52
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
