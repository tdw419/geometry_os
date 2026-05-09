; DESCRIPTION: Places a orange 47x38 rectangle at position (336, 127).
; PLAN: r0=336(x), r1=127(y), r2=47(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 127
LDI r2, 47
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
