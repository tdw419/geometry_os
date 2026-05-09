; DESCRIPTION: Places a green 54x22 rectangle at position (160, 199).
; PLAN: r0=160(x), r1=199(y), r2=54(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 199
LDI r2, 54
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
