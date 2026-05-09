; DESCRIPTION: Places a blue 83x54 rectangle at position (306, 161).
; PLAN: r0=306(x), r1=161(y), r2=83(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 161
LDI r2, 83
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
