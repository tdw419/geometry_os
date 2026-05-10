; DESCRIPTION: Places a green 86x102 rectangle at position (58, 51).
; PLAN: r0=58(x), r1=51(y), r2=86(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 51
LDI r2, 86
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
