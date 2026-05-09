; DESCRIPTION: Places a blue 72x99 rectangle at position (362, 27).
; PLAN: r0=362(x), r1=27(y), r2=72(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 27
LDI r2, 72
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
