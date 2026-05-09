; DESCRIPTION: Renders a red box of size 40x59 starting at (27, 51).
; PLAN: r0=27(x), r1=51(y), r2=40(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 51
LDI r2, 40
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
