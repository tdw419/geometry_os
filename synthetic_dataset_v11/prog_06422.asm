; DESCRIPTION: Places a red 85x21 rectangle at position (35, 103).
; PLAN: r0=35(x), r1=103(y), r2=85(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 103
LDI r2, 85
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
