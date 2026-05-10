; DESCRIPTION: Places a red 109x107 rectangle at position (336, 42).
; PLAN: r0=336(x), r1=42(y), r2=109(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 42
LDI r2, 109
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
