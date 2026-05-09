; DESCRIPTION: Places a cyan 100x105 rectangle at position (165, 104).
; PLAN: r0=165(x), r1=104(y), r2=100(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 104
LDI r2, 100
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
