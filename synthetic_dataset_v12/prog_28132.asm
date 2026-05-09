; DESCRIPTION: Renders a orange box of size 56x17 starting at (173, 225).
; PLAN: r0=173(x), r1=225(y), r2=56(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 225
LDI r2, 56
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
