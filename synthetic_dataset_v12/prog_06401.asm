; DESCRIPTION: Renders a magenta box of size 96x50 starting at (138, 169).
; PLAN: r0=138(x), r1=169(y), r2=96(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 169
LDI r2, 96
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
