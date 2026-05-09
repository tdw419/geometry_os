; DESCRIPTION: Renders a red box of size 14x94 starting at (185, 108).
; PLAN: r0=185(x), r1=108(y), r2=14(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 108
LDI r2, 14
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
