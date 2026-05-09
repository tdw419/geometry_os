; DESCRIPTION: Places a white 22x33 rectangle at position (41, 178).
; PLAN: r0=41(x), r1=178(y), r2=22(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 178
LDI r2, 22
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
