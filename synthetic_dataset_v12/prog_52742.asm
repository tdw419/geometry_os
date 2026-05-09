; DESCRIPTION: Renders a orange box of size 58x33 starting at (269, 187).
; PLAN: r0=269(x), r1=187(y), r2=58(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 187
LDI r2, 58
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
