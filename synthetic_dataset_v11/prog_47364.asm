; DESCRIPTION: Places a white 104x61 rectangle at position (70, 76).
; PLAN: r0=70(x), r1=76(y), r2=104(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 76
LDI r2, 104
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
