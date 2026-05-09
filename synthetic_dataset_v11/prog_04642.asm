; DESCRIPTION: Places a red 89x51 rectangle at position (108, 180).
; PLAN: r0=108(x), r1=180(y), r2=89(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 180
LDI r2, 89
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
