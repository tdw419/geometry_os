; DESCRIPTION: Draws a red circle centered at (154, 153) with radius 59.
; PLAN: r0=154(x), r1=153(y), r2=59(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 153
LDI r2, 59
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
