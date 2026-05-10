; DESCRIPTION: Places a blue 51x62 rectangle at position (392, 6).
; PLAN: r0=392(x), r1=6(y), r2=51(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 6
LDI r2, 51
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
