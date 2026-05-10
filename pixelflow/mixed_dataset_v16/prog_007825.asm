; DESCRIPTION: Renders a blue box of size 112x54 starting at (152, 42).
; PLAN: r0=152(x), r1=42(y), r2=112(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 42
LDI r2, 112
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
