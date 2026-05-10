; DESCRIPTION: Renders a magenta box of size 111x34 starting at (85, 220).
; PLAN: r0=85(x), r1=220(y), r2=111(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 220
LDI r2, 111
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
