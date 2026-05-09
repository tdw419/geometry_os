; DESCRIPTION: Places a white 80x62 rectangle at position (72, 42).
; PLAN: r0=72(x), r1=42(y), r2=80(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 42
LDI r2, 80
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
