; DESCRIPTION: Places a cyan 118x87 rectangle at position (153, 95).
; PLAN: r0=153(x), r1=95(y), r2=118(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 95
LDI r2, 118
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
