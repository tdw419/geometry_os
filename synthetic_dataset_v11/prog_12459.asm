; DESCRIPTION: Places a cyan 90x106 rectangle at position (75, 127).
; PLAN: r0=75(x), r1=127(y), r2=90(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 127
LDI r2, 90
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
