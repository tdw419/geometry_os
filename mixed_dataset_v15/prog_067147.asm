; DESCRIPTION: Places a blue 51x59 rectangle at position (172, 167).
; PLAN: r0=172(x), r1=167(y), r2=51(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 167
LDI r2, 51
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
