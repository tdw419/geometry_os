; DESCRIPTION: Places a green 68x96 rectangle at position (12, 127).
; PLAN: r0=12(x), r1=127(y), r2=68(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 127
LDI r2, 68
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
