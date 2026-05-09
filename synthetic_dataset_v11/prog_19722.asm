; DESCRIPTION: Renders a red box of size 63x29 starting at (127, 98).
; PLAN: r0=127(x), r1=98(y), r2=63(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 98
LDI r2, 63
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
