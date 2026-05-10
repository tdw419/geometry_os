; DESCRIPTION: Places a green 90x66 rectangle at position (209, 168).
; PLAN: r0=209(x), r1=168(y), r2=90(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 168
LDI r2, 90
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
