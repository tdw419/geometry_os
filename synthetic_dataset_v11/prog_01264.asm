; DESCRIPTION: Places a green 50x94 rectangle at position (171, 123).
; PLAN: r0=171(x), r1=123(y), r2=50(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 123
LDI r2, 50
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
