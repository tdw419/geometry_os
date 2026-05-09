; DESCRIPTION: Renders a magenta box of size 57x103 starting at (204, 44).
; PLAN: r0=204(x), r1=44(y), r2=57(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 44
LDI r2, 57
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
