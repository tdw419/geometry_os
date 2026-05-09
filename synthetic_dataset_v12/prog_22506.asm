; DESCRIPTION: Renders a orange box of size 56x92 starting at (199, 48).
; PLAN: r0=199(x), r1=48(y), r2=56(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 48
LDI r2, 56
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
