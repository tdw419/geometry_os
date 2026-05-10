; DESCRIPTION: Renders a magenta rectangular region spanning 82 by 28 at (103, 83).
; PLAN: r0=103(x), r1=83(y), r2=82(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 83
LDI r2, 82
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
