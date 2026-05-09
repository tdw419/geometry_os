; DESCRIPTION: Draws a red circle centered at (493, 67) with radius 18.
; PLAN: r0=493(x), r1=67(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 493
LDI r1, 67
LDI r2, 18
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
