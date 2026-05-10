; DESCRIPTION: Renders a blue box of size 57x113 starting at (138, 65).
; PLAN: r0=138(x), r1=65(y), r2=57(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 65
LDI r2, 57
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
