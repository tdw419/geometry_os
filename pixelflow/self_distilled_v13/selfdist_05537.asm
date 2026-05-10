; DESCRIPTION: Places a cyan 88x25 box at position (104, 125).
; PLAN: r0=104(x), r1=125(y), r2=88(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 125
LDI r2, 88
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
