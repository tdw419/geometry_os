; DESCRIPTION: Renders a red box of size 27x11 starting at (97, 54).
; PLAN: r0=97(x), r1=54(y), r2=27(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 54
LDI r2, 27
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
