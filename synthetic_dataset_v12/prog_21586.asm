; DESCRIPTION: Draws a cyan circle centered at (92, 221) with radius 27.
; PLAN: r0=92(x), r1=221(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 92
LDI r1, 221
LDI r2, 27
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
