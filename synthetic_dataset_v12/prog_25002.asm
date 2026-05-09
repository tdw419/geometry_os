; DESCRIPTION: Renders a red box of size 63x97 starting at (96, 127).
; PLAN: r0=96(x), r1=127(y), r2=63(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 127
LDI r2, 63
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
