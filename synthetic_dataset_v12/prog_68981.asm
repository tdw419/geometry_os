; DESCRIPTION: Places a green 65x80 rectangle at position (53, 160).
; PLAN: r0=53(x), r1=160(y), r2=65(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 160
LDI r2, 65
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
