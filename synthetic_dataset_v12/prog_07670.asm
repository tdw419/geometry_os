; DESCRIPTION: Renders a red box of size 67x92 starting at (350, 27).
; PLAN: r0=350(x), r1=27(y), r2=67(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 27
LDI r2, 67
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
