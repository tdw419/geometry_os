; DESCRIPTION: Renders a red box of size 67x48 starting at (423, 44).
; PLAN: r0=423(x), r1=44(y), r2=67(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 44
LDI r2, 67
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
