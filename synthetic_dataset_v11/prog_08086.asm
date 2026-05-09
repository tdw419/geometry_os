; DESCRIPTION: Places a blue 68x40 rectangle at position (135, 167).
; PLAN: r0=135(x), r1=167(y), r2=68(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 167
LDI r2, 68
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
