; DESCRIPTION: Places a green 51x96 rectangle at position (180, 136).
; PLAN: r0=180(x), r1=136(y), r2=51(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 136
LDI r2, 51
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
