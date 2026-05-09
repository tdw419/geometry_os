; DESCRIPTION: Renders a magenta box of size 38x63 starting at (322, 83).
; PLAN: r0=322(x), r1=83(y), r2=38(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 83
LDI r2, 38
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
