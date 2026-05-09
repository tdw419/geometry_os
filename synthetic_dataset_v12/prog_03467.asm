; DESCRIPTION: Places a green 29x47 rectangle at position (47, 123).
; PLAN: r0=47(x), r1=123(y), r2=29(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 123
LDI r2, 29
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
