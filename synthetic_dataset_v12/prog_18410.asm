; DESCRIPTION: Places a white 83x120 rectangle at position (105, 52).
; PLAN: r0=105(x), r1=52(y), r2=83(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 52
LDI r2, 83
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
