; DESCRIPTION: Renders a red box of size 65x103 starting at (3, 47).
; PLAN: r0=3(x), r1=47(y), r2=65(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 47
LDI r2, 65
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
