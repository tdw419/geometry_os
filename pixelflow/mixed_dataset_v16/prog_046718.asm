; DESCRIPTION: Draws a red rectangle at (398, 56) with width 67 and height 69.
; PLAN: r0=398(x), r1=56(y), r2=67(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 56
LDI r2, 67
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
