; DESCRIPTION: Renders a magenta rectangular region spanning 87 by 60 at (170, 164).
; PLAN: r0=170(x), r1=164(y), r2=87(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 164
LDI r2, 87
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
