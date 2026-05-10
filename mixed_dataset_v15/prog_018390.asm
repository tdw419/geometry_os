; DESCRIPTION: Renders a magenta box of size 28x105 starting at (107, 16).
; PLAN: r0=107(x), r1=16(y), r2=28(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 16
LDI r2, 28
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
