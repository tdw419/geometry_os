; DESCRIPTION: Draws a cyan circle centered at (387, 103) with radius 52.
; PLAN: r0=387(x), r1=103(y), r2=52(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 103
LDI r2, 52
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
