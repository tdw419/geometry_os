; DESCRIPTION: Renders a magenta box of size 46x107 starting at (130, 58).
; PLAN: r0=130(x), r1=58(y), r2=46(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 58
LDI r2, 46
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
