; DESCRIPTION: Places a white 41x103 rectangle at position (160, 69).
; PLAN: r0=160(x), r1=69(y), r2=41(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 69
LDI r2, 41
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
