; DESCRIPTION: Places a white 20x32 rectangle at position (219, 54).
; PLAN: r0=219(x), r1=54(y), r2=20(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 54
LDI r2, 20
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
