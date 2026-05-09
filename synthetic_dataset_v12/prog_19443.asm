; DESCRIPTION: Renders a red box of size 91x21 starting at (127, 49).
; PLAN: r0=127(x), r1=49(y), r2=91(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 49
LDI r2, 91
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
