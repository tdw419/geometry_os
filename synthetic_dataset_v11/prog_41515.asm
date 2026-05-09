; DESCRIPTION: Renders a red box of size 65x116 starting at (185, 56).
; PLAN: r0=185(x), r1=56(y), r2=65(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 56
LDI r2, 65
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
