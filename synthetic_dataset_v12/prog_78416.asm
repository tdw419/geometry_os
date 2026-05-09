; DESCRIPTION: Places a green 75x59 rectangle at position (234, 115).
; PLAN: r0=234(x), r1=115(y), r2=75(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 115
LDI r2, 75
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
