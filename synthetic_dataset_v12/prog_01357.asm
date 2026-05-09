; DESCRIPTION: Places a orange 46x72 rectangle at position (53, 171).
; PLAN: r0=53(x), r1=171(y), r2=46(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 171
LDI r2, 46
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
