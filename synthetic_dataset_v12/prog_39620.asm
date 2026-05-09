; DESCRIPTION: Renders a magenta box of size 82x98 starting at (63, 98).
; PLAN: r0=63(x), r1=98(y), r2=82(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 98
LDI r2, 82
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
