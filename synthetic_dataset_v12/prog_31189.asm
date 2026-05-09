; DESCRIPTION: Renders a magenta box of size 25x23 starting at (9, 152).
; PLAN: r0=9(x), r1=152(y), r2=25(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 152
LDI r2, 25
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
