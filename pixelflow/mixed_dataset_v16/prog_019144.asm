; DESCRIPTION: Renders a red box of size 24x18 starting at (246, 131).
; PLAN: r0=246(x), r1=131(y), r2=24(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 131
LDI r2, 24
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
