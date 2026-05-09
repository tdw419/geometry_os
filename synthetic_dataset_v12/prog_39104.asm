; DESCRIPTION: Renders a magenta box of size 74x29 starting at (410, 63).
; PLAN: r0=410(x), r1=63(y), r2=74(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 63
LDI r2, 74
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
