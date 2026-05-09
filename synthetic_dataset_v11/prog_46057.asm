; DESCRIPTION: Places a purple 106x75 rectangle at position (32, 146).
; PLAN: r0=32(x), r1=146(y), r2=106(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 146
LDI r2, 106
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
