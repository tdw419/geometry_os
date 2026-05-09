; DESCRIPTION: Places a white 78x45 rectangle at position (371, 135).
; PLAN: r0=371(x), r1=135(y), r2=78(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 135
LDI r2, 78
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
