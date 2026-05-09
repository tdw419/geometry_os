; DESCRIPTION: Renders a magenta box of size 72x63 starting at (268, 82).
; PLAN: r0=268(x), r1=82(y), r2=72(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 82
LDI r2, 72
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
