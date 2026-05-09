; DESCRIPTION: Places a green 100x61 rectangle at position (29, 172).
; PLAN: r0=29(x), r1=172(y), r2=100(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 172
LDI r2, 100
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
