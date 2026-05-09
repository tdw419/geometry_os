; DESCRIPTION: Renders a orange box of size 72x44 starting at (151, 210).
; PLAN: r0=151(x), r1=210(y), r2=72(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 210
LDI r2, 72
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
