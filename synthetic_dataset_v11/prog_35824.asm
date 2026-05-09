; DESCRIPTION: Renders a orange box of size 88x14 starting at (146, 80).
; PLAN: r0=146(x), r1=80(y), r2=88(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 80
LDI r2, 88
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
