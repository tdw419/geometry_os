; DESCRIPTION: Places a blue 47x99 rectangle at position (425, 115).
; PLAN: r0=425(x), r1=115(y), r2=47(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 115
LDI r2, 47
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
