; DESCRIPTION: Places a green 71x68 rectangle at position (210, 110).
; PLAN: r0=210(x), r1=110(y), r2=71(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 110
LDI r2, 71
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
