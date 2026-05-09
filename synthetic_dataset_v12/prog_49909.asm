; DESCRIPTION: Places a green 56x72 rectangle at position (220, 118).
; PLAN: r0=220(x), r1=118(y), r2=56(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 118
LDI r2, 56
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
