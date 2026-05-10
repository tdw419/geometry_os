; DESCRIPTION: Places a cyan 42x16 box at position (11, 162).
; PLAN: r0=11(x), r1=162(y), r2=42(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 162
LDI r2, 42
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
