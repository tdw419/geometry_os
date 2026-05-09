; DESCRIPTION: Places a purple 114x115 rectangle at position (281, 75).
; PLAN: r0=281(x), r1=75(y), r2=114(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 75
LDI r2, 114
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
