; DESCRIPTION: Places a green 19x47 rectangle at position (440, 181).
; PLAN: r0=440(x), r1=181(y), r2=19(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 181
LDI r2, 19
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
