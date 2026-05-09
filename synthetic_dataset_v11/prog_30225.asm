; DESCRIPTION: Renders a red box of size 28x76 starting at (185, 166).
; PLAN: r0=185(x), r1=166(y), r2=28(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 166
LDI r2, 28
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
