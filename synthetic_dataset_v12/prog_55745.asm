; DESCRIPTION: Places a blue 29x74 rectangle at position (391, 91).
; PLAN: r0=391(x), r1=91(y), r2=29(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 91
LDI r2, 29
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
