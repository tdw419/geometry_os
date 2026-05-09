; DESCRIPTION: Places a magenta 76x34 rectangle at position (178, 142).
; PLAN: r0=178(x), r1=142(y), r2=76(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 142
LDI r2, 76
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
