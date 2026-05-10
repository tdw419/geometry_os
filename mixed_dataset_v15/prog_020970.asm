; DESCRIPTION: Places a red 25x115 rectangle at position (387, 97).
; PLAN: r0=387(x), r1=97(y), r2=25(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 97
LDI r2, 25
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
