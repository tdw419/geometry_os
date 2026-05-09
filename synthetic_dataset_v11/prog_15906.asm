; DESCRIPTION: Places a white 73x37 rectangle at position (131, 135).
; PLAN: r0=131(x), r1=135(y), r2=73(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 135
LDI r2, 73
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
