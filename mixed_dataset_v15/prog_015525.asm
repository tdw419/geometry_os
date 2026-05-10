; DESCRIPTION: Renders a red box of size 54x46 starting at (220, 18).
; PLAN: r0=220(x), r1=18(y), r2=54(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 18
LDI r2, 54
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
