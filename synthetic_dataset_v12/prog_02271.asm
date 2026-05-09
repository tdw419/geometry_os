; DESCRIPTION: Renders a red box of size 20x91 starting at (470, 39).
; PLAN: r0=470(x), r1=39(y), r2=20(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 39
LDI r2, 20
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
