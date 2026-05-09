; DESCRIPTION: Places a white 47x96 rectangle at position (365, 110).
; PLAN: r0=365(x), r1=110(y), r2=47(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 110
LDI r2, 47
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
