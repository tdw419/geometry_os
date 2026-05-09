; DESCRIPTION: Places a magenta 90x61 rectangle at position (362, 45).
; PLAN: r0=362(x), r1=45(y), r2=90(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 45
LDI r2, 90
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
