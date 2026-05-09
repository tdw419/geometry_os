; DESCRIPTION: Places a white 41x108 rectangle at position (297, 40).
; PLAN: r0=297(x), r1=40(y), r2=41(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 40
LDI r2, 41
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
