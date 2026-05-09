; DESCRIPTION: Places a red 53x109 rectangle at position (34, 80).
; PLAN: r0=34(x), r1=80(y), r2=53(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 80
LDI r2, 53
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
