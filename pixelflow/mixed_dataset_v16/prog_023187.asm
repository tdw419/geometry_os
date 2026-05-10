; DESCRIPTION: Places a white 59x41 rectangle at position (225, 202).
; PLAN: r0=225(x), r1=202(y), r2=59(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 202
LDI r2, 59
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
