; DESCRIPTION: Places a magenta 117x90 rectangle at position (85, 44).
; PLAN: r0=85(x), r1=44(y), r2=117(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 44
LDI r2, 117
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
