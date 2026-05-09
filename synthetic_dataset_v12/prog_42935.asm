; DESCRIPTION: Renders a orange box of size 32x13 starting at (308, 58).
; PLAN: r0=308(x), r1=58(y), r2=32(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 58
LDI r2, 32
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
