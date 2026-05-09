; DESCRIPTION: Renders a red box of size 105x50 starting at (221, 3).
; PLAN: r0=221(x), r1=3(y), r2=105(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 3
LDI r2, 105
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
