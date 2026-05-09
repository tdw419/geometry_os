; DESCRIPTION: Draws a cyan circle centered at (95, 202) with radius 52.
; PLAN: r0=95(x), r1=202(y), r2=52(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 202
LDI r2, 52
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
