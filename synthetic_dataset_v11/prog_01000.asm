; DESCRIPTION: Places a cyan 110x12 rectangle at position (104, 239).
; PLAN: r0=104(x), r1=239(y), r2=110(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 239
LDI r2, 110
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
