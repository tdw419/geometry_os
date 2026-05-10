; DESCRIPTION: Creates a orange filled rectangle of size 62x116 starting at (346, 149).
; PLAN: r0=346(x), r1=149(y), r2=62(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 149
LDI r2, 62
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
