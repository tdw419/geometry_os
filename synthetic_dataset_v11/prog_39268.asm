; DESCRIPTION: Places a green 57x63 rectangle at position (74, 74).
; PLAN: r0=74(x), r1=74(y), r2=57(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 74
LDI r2, 57
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
