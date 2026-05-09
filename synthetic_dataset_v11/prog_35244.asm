; DESCRIPTION: Places a green 98x92 rectangle at position (29, 140).
; PLAN: r0=29(x), r1=140(y), r2=98(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 140
LDI r2, 98
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
