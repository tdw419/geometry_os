; DESCRIPTION: Renders a red box of size 49x68 starting at (154, 54).
; PLAN: r0=154(x), r1=54(y), r2=49(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 54
LDI r2, 49
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
