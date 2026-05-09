; DESCRIPTION: Places a red 85x31 rectangle at position (198, 62).
; PLAN: r0=198(x), r1=62(y), r2=85(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 62
LDI r2, 85
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
