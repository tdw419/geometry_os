; DESCRIPTION: Places a white 113x41 rectangle at position (0, 181).
; PLAN: r0=0(x), r1=181(y), r2=113(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 181
LDI r2, 113
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
