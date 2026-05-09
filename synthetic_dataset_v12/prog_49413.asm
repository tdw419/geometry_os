; DESCRIPTION: Renders a red box of size 80x50 starting at (29, 37).
; PLAN: r0=29(x), r1=37(y), r2=80(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 37
LDI r2, 80
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
