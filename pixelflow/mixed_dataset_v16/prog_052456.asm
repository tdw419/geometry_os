; DESCRIPTION: Places a green 23x43 rectangle at position (240, 38).
; PLAN: r0=240(x), r1=38(y), r2=23(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 38
LDI r2, 23
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
