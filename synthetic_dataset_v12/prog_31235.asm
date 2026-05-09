; DESCRIPTION: Places a red 77x103 rectangle at position (428, 43).
; PLAN: r0=428(x), r1=43(y), r2=77(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 43
LDI r2, 77
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
