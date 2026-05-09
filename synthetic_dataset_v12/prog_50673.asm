; DESCRIPTION: Renders a orange box of size 113x92 starting at (209, 17).
; PLAN: r0=209(x), r1=17(y), r2=113(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 17
LDI r2, 113
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
