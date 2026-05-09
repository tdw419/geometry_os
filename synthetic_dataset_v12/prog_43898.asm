; DESCRIPTION: Places a white 105x64 rectangle at position (3, 75).
; PLAN: r0=3(x), r1=75(y), r2=105(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 75
LDI r2, 105
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
