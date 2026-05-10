; DESCRIPTION: Renders a red box of size 15x53 starting at (118, 174).
; PLAN: r0=118(x), r1=174(y), r2=15(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 174
LDI r2, 15
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
