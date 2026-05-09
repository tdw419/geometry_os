; DESCRIPTION: Renders a red box of size 108x72 starting at (31, 164).
; PLAN: r0=31(x), r1=164(y), r2=108(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 164
LDI r2, 108
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
