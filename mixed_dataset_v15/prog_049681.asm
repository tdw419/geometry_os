; DESCRIPTION: Places a blue 46x119 rectangle at position (366, 21).
; PLAN: r0=366(x), r1=21(y), r2=46(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 21
LDI r2, 46
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
