; DESCRIPTION: Renders a magenta box of size 103x115 starting at (135, 52).
; PLAN: r0=135(x), r1=52(y), r2=103(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 52
LDI r2, 103
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
