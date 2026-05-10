; DESCRIPTION: Places a blue 55x90 rectangle at position (329, 66).
; PLAN: r0=329(x), r1=66(y), r2=55(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 66
LDI r2, 55
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
