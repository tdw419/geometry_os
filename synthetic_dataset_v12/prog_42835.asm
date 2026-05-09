; DESCRIPTION: Places a cyan 115x46 rectangle at position (308, 133).
; PLAN: r0=308(x), r1=133(y), r2=115(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 133
LDI r2, 115
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
