; DESCRIPTION: Places a green 80x25 rectangle at position (385, 98).
; PLAN: r0=385(x), r1=98(y), r2=80(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 98
LDI r2, 80
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
