; DESCRIPTION: Places a red 45x109 rectangle at position (76, 8).
; PLAN: r0=76(x), r1=8(y), r2=45(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 8
LDI r2, 45
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
