; DESCRIPTION: Places a green 86x22 rectangle at position (215, 22).
; PLAN: r0=215(x), r1=22(y), r2=86(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 22
LDI r2, 86
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
