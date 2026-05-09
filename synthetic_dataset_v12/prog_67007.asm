; DESCRIPTION: Places a blue 15x15 rectangle at position (0, 107).
; PLAN: r0=0(x), r1=107(y), r2=15(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 107
LDI r2, 15
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
