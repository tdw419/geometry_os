; DESCRIPTION: Renders a red box of size 18x80 starting at (386, 97).
; PLAN: r0=386(x), r1=97(y), r2=18(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 97
LDI r2, 18
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
