; DESCRIPTION: Places a cyan 58x29 rectangle at position (80, 85).
; PLAN: r0=80(x), r1=85(y), r2=58(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 85
LDI r2, 58
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
