; DESCRIPTION: Places a green 34x83 rectangle at position (385, 166).
; PLAN: r0=385(x), r1=166(y), r2=34(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 166
LDI r2, 34
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
