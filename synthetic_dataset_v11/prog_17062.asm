; DESCRIPTION: Places a purple 113x63 rectangle at position (32, 187).
; PLAN: r0=32(x), r1=187(y), r2=113(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 187
LDI r2, 113
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
