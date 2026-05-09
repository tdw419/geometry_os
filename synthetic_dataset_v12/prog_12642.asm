; DESCRIPTION: Renders a magenta box of size 48x111 starting at (79, 75).
; PLAN: r0=79(x), r1=75(y), r2=48(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 75
LDI r2, 48
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
