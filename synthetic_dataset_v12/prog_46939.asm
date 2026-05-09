; DESCRIPTION: Renders a red box of size 72x22 starting at (342, 18).
; PLAN: r0=342(x), r1=18(y), r2=72(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 18
LDI r2, 72
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
