; DESCRIPTION: Renders a red box of size 80x54 starting at (7, 44).
; PLAN: r0=7(x), r1=44(y), r2=80(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 44
LDI r2, 80
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
