; DESCRIPTION: Places a green 16x103 rectangle at position (319, 8).
; PLAN: r0=319(x), r1=8(y), r2=16(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 8
LDI r2, 16
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
