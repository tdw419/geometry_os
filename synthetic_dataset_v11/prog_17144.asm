; DESCRIPTION: Renders a red box of size 59x96 starting at (156, 96).
; PLAN: r0=156(x), r1=96(y), r2=59(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 96
LDI r2, 59
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
