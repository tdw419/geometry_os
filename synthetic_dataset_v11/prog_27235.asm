; DESCRIPTION: Places a green 45x34 rectangle at position (142, 178).
; PLAN: r0=142(x), r1=178(y), r2=45(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 178
LDI r2, 45
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
