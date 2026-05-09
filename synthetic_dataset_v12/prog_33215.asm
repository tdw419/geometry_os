; DESCRIPTION: Places a white 102x115 rectangle at position (395, 41).
; PLAN: r0=395(x), r1=41(y), r2=102(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 41
LDI r2, 102
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
