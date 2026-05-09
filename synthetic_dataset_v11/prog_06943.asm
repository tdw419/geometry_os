; DESCRIPTION: Renders a purple box of size 42x113 starting at (29, 132).
; PLAN: r0=29(x), r1=132(y), r2=42(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 132
LDI r2, 42
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
