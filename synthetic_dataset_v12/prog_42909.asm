; DESCRIPTION: Renders a magenta box of size 29x38 starting at (79, 89).
; PLAN: r0=79(x), r1=89(y), r2=29(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 89
LDI r2, 29
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
