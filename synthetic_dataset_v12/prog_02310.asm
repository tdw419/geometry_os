; DESCRIPTION: Renders a red box of size 36x96 starting at (460, 36).
; PLAN: r0=460(x), r1=36(y), r2=36(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 36
LDI r2, 36
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
