; DESCRIPTION: Places a white 42x41 rectangle at position (459, 188).
; PLAN: r0=459(x), r1=188(y), r2=42(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 188
LDI r2, 42
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
