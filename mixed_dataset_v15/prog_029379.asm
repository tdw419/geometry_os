; DESCRIPTION: Renders a white box of size 80x88 starting at (295, 5).
; PLAN: r0=295(x), r1=5(y), r2=80(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 5
LDI r2, 80
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
