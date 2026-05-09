; DESCRIPTION: Places a blue 103x20 rectangle at position (127, 194).
; PLAN: r0=127(x), r1=194(y), r2=103(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 194
LDI r2, 103
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
