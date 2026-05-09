; DESCRIPTION: Places a cyan 91x109 rectangle at position (8, 125).
; PLAN: r0=8(x), r1=125(y), r2=91(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 125
LDI r2, 91
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
