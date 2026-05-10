; DESCRIPTION: Draws a cyan circle centered at (486, 95) with radius 16.
; PLAN: r0=486(x), r1=95(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 486
LDI r1, 95
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
