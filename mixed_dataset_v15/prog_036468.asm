; DESCRIPTION: Places a white 41x50 rectangle at position (39, 133).
; PLAN: r0=39(x), r1=133(y), r2=41(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 133
LDI r2, 41
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
