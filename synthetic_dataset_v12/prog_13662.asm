; DESCRIPTION: Renders a orange box of size 28x49 starting at (180, 84).
; PLAN: r0=180(x), r1=84(y), r2=28(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 84
LDI r2, 28
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
