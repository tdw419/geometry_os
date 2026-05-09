; DESCRIPTION: Places a white 20x30 rectangle at position (23, 219).
; PLAN: r0=23(x), r1=219(y), r2=20(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 219
LDI r2, 20
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
