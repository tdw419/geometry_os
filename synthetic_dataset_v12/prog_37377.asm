; DESCRIPTION: Places a cyan 113x106 rectangle at position (308, 89).
; PLAN: r0=308(x), r1=89(y), r2=113(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 89
LDI r2, 113
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
