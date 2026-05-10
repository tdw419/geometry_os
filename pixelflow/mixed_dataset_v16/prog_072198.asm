; DESCRIPTION: Renders a red box of size 80x25 starting at (25, 149).
; PLAN: r0=25(x), r1=149(y), r2=80(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 149
LDI r2, 80
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
