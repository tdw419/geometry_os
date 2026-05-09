; DESCRIPTION: Places a blue 72x17 rectangle at position (38, 153).
; PLAN: r0=38(x), r1=153(y), r2=72(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 153
LDI r2, 72
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
