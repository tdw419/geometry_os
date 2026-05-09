; DESCRIPTION: Places a blue 102x117 rectangle at position (99, 55).
; PLAN: r0=99(x), r1=55(y), r2=102(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 55
LDI r2, 102
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
