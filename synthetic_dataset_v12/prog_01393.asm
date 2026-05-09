; DESCRIPTION: Places a cyan 118x106 rectangle at position (198, 106).
; PLAN: r0=198(x), r1=106(y), r2=118(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 106
LDI r2, 118
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
