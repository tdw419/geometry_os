; DESCRIPTION: Places a red 84x117 box at position (33, 38).
; PLAN: r0=33(x), r1=38(y), r2=84(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 38
LDI r2, 84
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
