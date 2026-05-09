; DESCRIPTION: Renders a magenta box of size 75x28 starting at (367, 10).
; PLAN: r0=367(x), r1=10(y), r2=75(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 10
LDI r2, 75
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
