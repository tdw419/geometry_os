; DESCRIPTION: Places a white 105x100 rectangle at position (332, 21).
; PLAN: r0=332(x), r1=21(y), r2=105(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 21
LDI r2, 105
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
