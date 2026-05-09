; DESCRIPTION: Renders a red box of size 72x116 starting at (139, 131).
; PLAN: r0=139(x), r1=131(y), r2=72(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 131
LDI r2, 72
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
