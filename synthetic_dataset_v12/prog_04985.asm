; DESCRIPTION: Draws a red circle centered at (346, 95) with radius 76.
; PLAN: r0=346(x), r1=95(y), r2=76(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 95
LDI r2, 76
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
