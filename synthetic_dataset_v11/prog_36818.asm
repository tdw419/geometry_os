; DESCRIPTION: Renders a magenta box of size 28x70 starting at (120, 82).
; PLAN: r0=120(x), r1=82(y), r2=28(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 82
LDI r2, 28
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
