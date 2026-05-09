; DESCRIPTION: Places a green 91x15 rectangle at position (307, 106).
; PLAN: r0=307(x), r1=106(y), r2=91(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 106
LDI r2, 91
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
