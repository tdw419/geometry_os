; DESCRIPTION: Renders a white box of size 12x88 starting at (152, 135).
; PLAN: r0=152(x), r1=135(y), r2=12(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 135
LDI r2, 12
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
