; DESCRIPTION: Places a blue 63x117 rectangle at position (71, 28).
; PLAN: r0=71(x), r1=28(y), r2=63(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 28
LDI r2, 63
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
