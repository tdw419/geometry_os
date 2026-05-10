; DESCRIPTION: Renders a green rectangular region spanning 11 by 47 at (69, 59).
; PLAN: r0=69(x), r1=59(y), r2=11(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 59
LDI r2, 11
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
