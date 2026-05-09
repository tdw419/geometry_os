; DESCRIPTION: Places a green 80x78 rectangle at position (135, 68).
; PLAN: r0=135(x), r1=68(y), r2=80(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 68
LDI r2, 80
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
