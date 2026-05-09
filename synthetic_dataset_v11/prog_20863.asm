; DESCRIPTION: Renders a orange box of size 84x33 starting at (26, 164).
; PLAN: r0=26(x), r1=164(y), r2=84(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 164
LDI r2, 84
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
