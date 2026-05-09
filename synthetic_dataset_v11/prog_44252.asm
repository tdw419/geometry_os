; DESCRIPTION: Renders a red box of size 107x81 starting at (16, 9).
; PLAN: r0=16(x), r1=9(y), r2=107(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 9
LDI r2, 107
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
