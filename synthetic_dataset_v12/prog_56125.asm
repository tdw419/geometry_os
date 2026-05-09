; DESCRIPTION: Places a red 50x52 rectangle at position (50, 147).
; PLAN: r0=50(x), r1=147(y), r2=50(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 147
LDI r2, 50
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
