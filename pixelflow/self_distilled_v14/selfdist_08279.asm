; DESCRIPTION: Draws a cyan circle centered at (340, 151) with radius 48.
; PLAN: r0=340(x), r1=151(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 340
LDI r1, 151
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
