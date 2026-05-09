; DESCRIPTION: Renders a red box of size 61x38 starting at (253, 182).
; PLAN: r0=253(x), r1=182(y), r2=61(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 182
LDI r2, 61
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
