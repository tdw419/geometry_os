; DESCRIPTION: Renders a red box of size 12x10 starting at (196, 33).
; PLAN: r0=196(x), r1=33(y), r2=12(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 33
LDI r2, 12
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
