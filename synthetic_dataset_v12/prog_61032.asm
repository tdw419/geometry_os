; DESCRIPTION: Renders a red box of size 109x53 starting at (68, 45).
; PLAN: r0=68(x), r1=45(y), r2=109(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 45
LDI r2, 109
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
