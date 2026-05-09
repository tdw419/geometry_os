; DESCRIPTION: Places a green 45x15 rectangle at position (73, 135).
; PLAN: r0=73(x), r1=135(y), r2=45(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 135
LDI r2, 45
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
