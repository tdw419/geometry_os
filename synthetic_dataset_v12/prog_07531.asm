; DESCRIPTION: Renders a magenta box of size 82x100 starting at (255, 52).
; PLAN: r0=255(x), r1=52(y), r2=82(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 52
LDI r2, 82
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
