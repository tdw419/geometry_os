; DESCRIPTION: Places a green 60x108 rectangle at position (113, 127).
; PLAN: r0=113(x), r1=127(y), r2=60(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 127
LDI r2, 60
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
