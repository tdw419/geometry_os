; DESCRIPTION: Places a cyan 64x104 box at position (91, 98).
; PLAN: r0=91(x), r1=98(y), r2=64(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 98
LDI r2, 64
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
