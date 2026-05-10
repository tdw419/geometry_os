; DESCRIPTION: Places a magenta 65x115 rectangle at position (18, 66).
; PLAN: r0=18(x), r1=66(y), r2=65(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 66
LDI r2, 65
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
