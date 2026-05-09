; DESCRIPTION: Places a magenta 53x90 rectangle at position (186, 19).
; PLAN: r0=186(x), r1=19(y), r2=53(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 19
LDI r2, 53
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
