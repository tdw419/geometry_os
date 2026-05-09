; DESCRIPTION: Renders a orange box of size 21x13 starting at (104, 214).
; PLAN: r0=104(x), r1=214(y), r2=21(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 214
LDI r2, 21
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
