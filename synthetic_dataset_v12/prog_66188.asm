; DESCRIPTION: Places a blue 106x117 rectangle at position (236, 121).
; PLAN: r0=236(x), r1=121(y), r2=106(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 121
LDI r2, 106
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
