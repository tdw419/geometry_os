; DESCRIPTION: Renders a red box of size 99x98 starting at (127, 89).
; PLAN: r0=127(x), r1=89(y), r2=99(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 89
LDI r2, 99
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
