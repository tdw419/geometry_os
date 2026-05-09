; DESCRIPTION: Renders a orange box of size 33x92 starting at (272, 6).
; PLAN: r0=272(x), r1=6(y), r2=33(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 6
LDI r2, 33
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
