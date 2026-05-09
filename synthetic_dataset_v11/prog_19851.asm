; DESCRIPTION: Renders a red box of size 55x21 starting at (160, 156).
; PLAN: r0=160(x), r1=156(y), r2=55(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 156
LDI r2, 55
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
