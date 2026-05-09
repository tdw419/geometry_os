; DESCRIPTION: Places a blue 48x90 rectangle at position (252, 133).
; PLAN: r0=252(x), r1=133(y), r2=48(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 133
LDI r2, 48
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
