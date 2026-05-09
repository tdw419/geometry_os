; DESCRIPTION: Renders a magenta box of size 73x70 starting at (117, 95).
; PLAN: r0=117(x), r1=95(y), r2=73(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 95
LDI r2, 73
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
