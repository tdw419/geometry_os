; DESCRIPTION: Places a magenta 110x117 rectangle at position (387, 98).
; PLAN: r0=387(x), r1=98(y), r2=110(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 98
LDI r2, 110
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
