; DESCRIPTION: Places a white 112x18 rectangle at position (6, 233).
; PLAN: r0=6(x), r1=233(y), r2=112(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 233
LDI r2, 112
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
