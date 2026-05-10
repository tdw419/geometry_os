; DESCRIPTION: Renders a orange box of size 84x104 starting at (90, 135).
; PLAN: r0=90(x), r1=135(y), r2=84(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 135
LDI r2, 84
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
