; DESCRIPTION: Places a blue 64x40 rectangle at position (106, 187).
; PLAN: r0=106(x), r1=187(y), r2=64(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 187
LDI r2, 64
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
