; DESCRIPTION: Places a cyan 118x16 rectangle at position (187, 56).
; PLAN: r0=187(x), r1=56(y), r2=118(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 56
LDI r2, 118
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
