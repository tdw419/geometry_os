; DESCRIPTION: Places a green 11x94 rectangle at position (284, 118).
; PLAN: r0=284(x), r1=118(y), r2=11(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 118
LDI r2, 11
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
