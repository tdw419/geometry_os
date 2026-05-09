; DESCRIPTION: Places a magenta 12x117 rectangle at position (136, 134).
; PLAN: r0=136(x), r1=134(y), r2=12(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 134
LDI r2, 12
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
