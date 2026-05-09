; DESCRIPTION: Draws a cyan circle centered at (112, 93) with radius 56.
; PLAN: r0=112(x), r1=93(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 93
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
