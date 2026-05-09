; DESCRIPTION: Places a white 38x61 rectangle at position (32, 18).
; PLAN: r0=32(x), r1=18(y), r2=38(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 18
LDI r2, 38
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
