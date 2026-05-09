; DESCRIPTION: Places a blue 83x38 rectangle at position (104, 152).
; PLAN: r0=104(x), r1=152(y), r2=83(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 152
LDI r2, 83
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
