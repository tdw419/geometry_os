; DESCRIPTION: Renders a orange box of size 28x72 starting at (263, 108).
; PLAN: r0=263(x), r1=108(y), r2=28(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 108
LDI r2, 28
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
