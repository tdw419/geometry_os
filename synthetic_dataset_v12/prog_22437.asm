; DESCRIPTION: Places a orange 65x34 rectangle at position (296, 72).
; PLAN: r0=296(x), r1=72(y), r2=65(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 72
LDI r2, 65
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
