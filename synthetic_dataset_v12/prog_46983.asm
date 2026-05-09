; DESCRIPTION: Places a purple 23x27 rectangle at position (371, 132).
; PLAN: r0=371(x), r1=132(y), r2=23(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 132
LDI r2, 23
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
