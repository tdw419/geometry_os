; DESCRIPTION: Renders a red box of size 109x60 starting at (60, 65).
; PLAN: r0=60(x), r1=65(y), r2=109(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 65
LDI r2, 109
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
