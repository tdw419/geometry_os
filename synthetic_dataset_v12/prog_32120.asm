; DESCRIPTION: Places a white 56x87 rectangle at position (436, 58).
; PLAN: r0=436(x), r1=58(y), r2=56(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 58
LDI r2, 56
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
