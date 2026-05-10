; DESCRIPTION: Renders a green rectangular region spanning 78 by 103 at (79, 28).
; PLAN: r0=79(x), r1=28(y), r2=78(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 28
LDI r2, 78
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
