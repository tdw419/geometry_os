; DESCRIPTION: Places a white 68x32 rectangle at position (316, 38).
; PLAN: r0=316(x), r1=38(y), r2=68(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 38
LDI r2, 68
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
