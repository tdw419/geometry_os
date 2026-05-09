; DESCRIPTION: Places a green 69x33 rectangle at position (172, 99).
; PLAN: r0=172(x), r1=99(y), r2=69(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 99
LDI r2, 69
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
