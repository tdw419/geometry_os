; DESCRIPTION: Places a green 95x32 rectangle at position (220, 56).
; PLAN: r0=220(x), r1=56(y), r2=95(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 56
LDI r2, 95
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
