; DESCRIPTION: Renders a green box of size 11x12 starting at (436, 33).
; PLAN: r0=436(x), r1=33(y), r2=11(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 33
LDI r2, 11
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
