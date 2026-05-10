; DESCRIPTION: Places a red 50x42 box at position (336, 115).
; PLAN: r0=336(x), r1=115(y), r2=50(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 115
LDI r2, 50
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
