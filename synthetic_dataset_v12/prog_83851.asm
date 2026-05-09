; DESCRIPTION: Places a white 102x110 rectangle at position (117, 6).
; PLAN: r0=117(x), r1=6(y), r2=102(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 6
LDI r2, 102
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
