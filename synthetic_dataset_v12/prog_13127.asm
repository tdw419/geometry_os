; DESCRIPTION: Renders a red box of size 92x66 starting at (45, 38).
; PLAN: r0=45(x), r1=38(y), r2=92(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 38
LDI r2, 92
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
