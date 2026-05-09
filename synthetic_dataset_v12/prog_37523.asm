; DESCRIPTION: Places a white 99x88 rectangle at position (308, 32).
; PLAN: r0=308(x), r1=32(y), r2=99(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 32
LDI r2, 99
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
