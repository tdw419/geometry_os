; DESCRIPTION: Places a red 62x60 rectangle at position (428, 8).
; PLAN: r0=428(x), r1=8(y), r2=62(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 8
LDI r2, 62
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
