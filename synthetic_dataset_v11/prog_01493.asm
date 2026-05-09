; DESCRIPTION: Places a blue 38x20 rectangle at position (181, 55).
; PLAN: r0=181(x), r1=55(y), r2=38(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 55
LDI r2, 38
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
