; DESCRIPTION: Places a green 29x92 rectangle at position (73, 127).
; PLAN: r0=73(x), r1=127(y), r2=29(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 127
LDI r2, 29
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
