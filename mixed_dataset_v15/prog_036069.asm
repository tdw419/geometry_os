; DESCRIPTION: Renders a orange box of size 75x92 starting at (210, 31).
; PLAN: r0=210(x), r1=31(y), r2=75(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 31
LDI r2, 75
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
