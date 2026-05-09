; DESCRIPTION: Renders a orange box of size 35x44 starting at (152, 152).
; PLAN: r0=152(x), r1=152(y), r2=35(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 152
LDI r2, 35
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
