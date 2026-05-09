; DESCRIPTION: Places a green 33x106 rectangle at position (3, 108).
; PLAN: r0=3(x), r1=108(y), r2=33(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 108
LDI r2, 33
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
