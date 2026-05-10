; DESCRIPTION: Renders a magenta rectangular region spanning 64 by 29 at (284, 145).
; PLAN: r0=284(x), r1=145(y), r2=64(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 145
LDI r2, 64
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
