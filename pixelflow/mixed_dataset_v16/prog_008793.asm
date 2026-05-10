; DESCRIPTION: Places a purple 72x90 rectangle at position (249, 87).
; PLAN: r0=249(x), r1=87(y), r2=72(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 87
LDI r2, 72
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
