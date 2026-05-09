; DESCRIPTION: Renders a red box of size 47x54 starting at (138, 183).
; PLAN: r0=138(x), r1=183(y), r2=47(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 183
LDI r2, 47
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
