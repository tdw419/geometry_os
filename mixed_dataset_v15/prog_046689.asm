; DESCRIPTION: Places a green 70x108 rectangle at position (369, 24).
; PLAN: r0=369(x), r1=24(y), r2=70(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 24
LDI r2, 70
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
