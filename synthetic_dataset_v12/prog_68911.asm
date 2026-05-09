; DESCRIPTION: Places a green 95x105 rectangle at position (140, 127).
; PLAN: r0=140(x), r1=127(y), r2=95(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 127
LDI r2, 95
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
