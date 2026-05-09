; DESCRIPTION: Places a green 16x22 rectangle at position (176, 79).
; PLAN: r0=176(x), r1=79(y), r2=16(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 79
LDI r2, 16
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
