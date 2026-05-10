; DESCRIPTION: Places a cyan 23x51 rectangle at position (95, 116).
; PLAN: r0=95(x), r1=116(y), r2=23(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 116
LDI r2, 23
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
