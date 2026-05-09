; DESCRIPTION: Places a blue 22x41 rectangle at position (220, 186).
; PLAN: r0=220(x), r1=186(y), r2=22(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 186
LDI r2, 22
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
