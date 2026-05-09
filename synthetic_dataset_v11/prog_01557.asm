; DESCRIPTION: Renders a red box of size 59x58 starting at (140, 61).
; PLAN: r0=140(x), r1=61(y), r2=59(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 61
LDI r2, 59
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
