; DESCRIPTION: Renders a magenta box of size 56x39 starting at (2, 180).
; PLAN: r0=2(x), r1=180(y), r2=56(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 180
LDI r2, 56
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
