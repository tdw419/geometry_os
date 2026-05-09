; DESCRIPTION: Places a white 37x49 rectangle at position (16, 60).
; PLAN: r0=16(x), r1=60(y), r2=37(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 60
LDI r2, 37
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
