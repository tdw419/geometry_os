; DESCRIPTION: Renders a magenta box of size 55x46 starting at (203, 94).
; PLAN: r0=203(x), r1=94(y), r2=55(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 94
LDI r2, 55
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
