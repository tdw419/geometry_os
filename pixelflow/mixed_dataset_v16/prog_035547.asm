; DESCRIPTION: Places a green 91x13 rectangle at position (333, 226).
; PLAN: r0=333(x), r1=226(y), r2=91(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 226
LDI r2, 91
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
