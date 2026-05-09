; DESCRIPTION: Renders a red box of size 108x110 starting at (25, 113).
; PLAN: r0=25(x), r1=113(y), r2=108(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 113
LDI r2, 108
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
