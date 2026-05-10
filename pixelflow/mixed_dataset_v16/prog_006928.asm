; DESCRIPTION: Renders a red box of size 67x72 starting at (371, 98).
; PLAN: r0=371(x), r1=98(y), r2=67(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 98
LDI r2, 67
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
