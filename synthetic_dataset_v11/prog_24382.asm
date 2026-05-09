; DESCRIPTION: Places a yellow 84x115 rectangle at position (37, 133).
; PLAN: r0=37(x), r1=133(y), r2=84(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 133
LDI r2, 84
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
