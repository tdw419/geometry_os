; DESCRIPTION: Renders a magenta rectangular region spanning 105 by 103 at (21, 142).
; PLAN: r0=21(x), r1=142(y), r2=105(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 142
LDI r2, 105
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
