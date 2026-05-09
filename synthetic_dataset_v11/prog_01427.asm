; DESCRIPTION: Renders a red box of size 44x27 starting at (135, 23).
; PLAN: r0=135(x), r1=23(y), r2=44(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 23
LDI r2, 44
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
