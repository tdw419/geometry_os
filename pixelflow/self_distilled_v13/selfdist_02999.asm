; DESCRIPTION: Places a yellow 16x49 box at position (117, 82).
; PLAN: r0=117(x), r1=82(y), r2=16(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 82
LDI r2, 16
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
