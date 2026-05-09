; DESCRIPTION: Renders a yellow box of size 88x15 starting at (146, 157).
; PLAN: r0=146(x), r1=157(y), r2=88(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 157
LDI r2, 88
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
