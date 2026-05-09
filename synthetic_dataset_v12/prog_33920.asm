; DESCRIPTION: Renders a red box of size 86x52 starting at (16, 19).
; PLAN: r0=16(x), r1=19(y), r2=86(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 19
LDI r2, 86
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
