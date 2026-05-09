; DESCRIPTION: Places a blue 118x53 rectangle at position (135, 169).
; PLAN: r0=135(x), r1=169(y), r2=118(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 169
LDI r2, 118
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
