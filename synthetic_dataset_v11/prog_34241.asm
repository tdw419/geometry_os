; DESCRIPTION: Renders a red box of size 93x61 starting at (131, 153).
; PLAN: r0=131(x), r1=153(y), r2=93(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 153
LDI r2, 93
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
