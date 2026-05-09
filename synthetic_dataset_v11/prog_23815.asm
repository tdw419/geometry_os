; DESCRIPTION: Places a green 44x79 rectangle at position (108, 163).
; PLAN: r0=108(x), r1=163(y), r2=44(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 163
LDI r2, 44
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
