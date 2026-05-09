; DESCRIPTION: Renders a red box of size 15x13 starting at (146, 64).
; PLAN: r0=146(x), r1=64(y), r2=15(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 64
LDI r2, 15
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
