; DESCRIPTION: Renders a red box of size 40x60 starting at (345, 65).
; PLAN: r0=345(x), r1=65(y), r2=40(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 65
LDI r2, 40
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
