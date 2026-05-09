; DESCRIPTION: Renders a red box of size 92x117 starting at (57, 85).
; PLAN: r0=57(x), r1=85(y), r2=92(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 85
LDI r2, 92
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
