; DESCRIPTION: Places a red 85x103 rectangle at position (103, 36).
; PLAN: r0=103(x), r1=36(y), r2=85(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 36
LDI r2, 85
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
