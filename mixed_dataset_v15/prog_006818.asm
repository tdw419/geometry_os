; DESCRIPTION: Places a red 108x120 rectangle at position (7, 54).
; PLAN: r0=7(x), r1=54(y), r2=108(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 54
LDI r2, 108
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
