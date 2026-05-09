; DESCRIPTION: Places a orange 46x76 rectangle at position (43, 129).
; PLAN: r0=43(x), r1=129(y), r2=46(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 129
LDI r2, 46
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
