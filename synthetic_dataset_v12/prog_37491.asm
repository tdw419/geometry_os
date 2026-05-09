; DESCRIPTION: Renders a red box of size 88x50 starting at (29, 152).
; PLAN: r0=29(x), r1=152(y), r2=88(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 152
LDI r2, 88
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
