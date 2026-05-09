; DESCRIPTION: Places a green 74x99 rectangle at position (32, 40).
; PLAN: r0=32(x), r1=40(y), r2=74(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 40
LDI r2, 74
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
