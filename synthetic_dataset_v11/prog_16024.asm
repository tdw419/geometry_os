; DESCRIPTION: Places a blue 29x44 rectangle at position (56, 164).
; PLAN: r0=56(x), r1=164(y), r2=29(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 164
LDI r2, 29
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
