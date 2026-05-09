; DESCRIPTION: Places a cyan 100x31 rectangle at position (162, 125).
; PLAN: r0=162(x), r1=125(y), r2=100(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 125
LDI r2, 100
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
