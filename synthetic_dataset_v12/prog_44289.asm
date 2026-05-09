; DESCRIPTION: Places a red 40x49 rectangle at position (133, 49).
; PLAN: r0=133(x), r1=49(y), r2=40(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 49
LDI r2, 40
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
