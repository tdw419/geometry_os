; DESCRIPTION: Renders a red box of size 119x16 starting at (171, 108).
; PLAN: r0=171(x), r1=108(y), r2=119(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 108
LDI r2, 119
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
