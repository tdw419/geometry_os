; DESCRIPTION: Places a white 41x45 rectangle at position (266, 32).
; PLAN: r0=266(x), r1=32(y), r2=41(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 32
LDI r2, 41
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
