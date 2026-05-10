; DESCRIPTION: Places a white 108x104 rectangle at position (337, 47).
; PLAN: r0=337(x), r1=47(y), r2=108(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 47
LDI r2, 108
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
