; DESCRIPTION: Places a yellow 16x67 rectangle at position (185, 32).
; PLAN: r0=185(x), r1=32(y), r2=16(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 32
LDI r2, 16
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
