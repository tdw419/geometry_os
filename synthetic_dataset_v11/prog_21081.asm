; DESCRIPTION: Renders a red box of size 99x56 starting at (92, 87).
; PLAN: r0=92(x), r1=87(y), r2=99(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 87
LDI r2, 99
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
