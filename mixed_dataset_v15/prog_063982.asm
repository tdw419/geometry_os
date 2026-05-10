; DESCRIPTION: Places a red 75x25 box at position (241, 135).
; PLAN: r0=241(x), r1=135(y), r2=75(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 135
LDI r2, 75
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
