; DESCRIPTION: Renders a red box of size 85x38 starting at (21, 54).
; PLAN: r0=21(x), r1=54(y), r2=85(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 54
LDI r2, 85
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
