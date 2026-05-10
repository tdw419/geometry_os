; DESCRIPTION: Renders a orange box of size 58x73 starting at (276, 48).
; PLAN: r0=276(x), r1=48(y), r2=58(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 48
LDI r2, 58
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
