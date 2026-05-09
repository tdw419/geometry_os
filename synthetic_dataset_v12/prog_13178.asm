; DESCRIPTION: Places a orange 29x120 rectangle at position (336, 75).
; PLAN: r0=336(x), r1=75(y), r2=29(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 75
LDI r2, 29
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
