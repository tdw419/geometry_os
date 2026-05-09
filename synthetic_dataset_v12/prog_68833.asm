; DESCRIPTION: Places a purple 22x36 rectangle at position (187, 128).
; PLAN: r0=187(x), r1=128(y), r2=22(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 128
LDI r2, 22
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
