; DESCRIPTION: Places a yellow 16x31 rectangle at position (29, 144).
; PLAN: r0=29(x), r1=144(y), r2=16(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 144
LDI r2, 16
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
