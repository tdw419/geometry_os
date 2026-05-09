; DESCRIPTION: Renders a red box of size 40x87 starting at (171, 119).
; PLAN: r0=171(x), r1=119(y), r2=40(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 119
LDI r2, 40
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
