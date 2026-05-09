; DESCRIPTION: Places a black 38x98 rectangle at position (147, 42).
; PLAN: r0=147(x), r1=42(y), r2=38(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 42
LDI r2, 38
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
