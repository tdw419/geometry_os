; DESCRIPTION: Places a yellow 64x25 rectangle at position (144, 68).
; PLAN: r0=144(x), r1=68(y), r2=64(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 68
LDI r2, 64
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
