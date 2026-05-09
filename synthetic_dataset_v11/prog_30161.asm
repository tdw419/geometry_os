; DESCRIPTION: Places a orange 41x42 rectangle at position (164, 189).
; PLAN: r0=164(x), r1=189(y), r2=41(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 189
LDI r2, 41
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
