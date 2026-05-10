; DESCRIPTION: Places a white 58x12 rectangle at position (340, 62).
; PLAN: r0=340(x), r1=62(y), r2=58(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 62
LDI r2, 58
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
