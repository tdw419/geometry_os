; DESCRIPTION: Renders a red box of size 16x15 starting at (86, 142).
; PLAN: r0=86(x), r1=142(y), r2=16(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 142
LDI r2, 16
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
