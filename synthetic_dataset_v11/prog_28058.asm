; DESCRIPTION: Places a red 41x42 rectangle at position (104, 65).
; PLAN: r0=104(x), r1=65(y), r2=41(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 65
LDI r2, 41
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
