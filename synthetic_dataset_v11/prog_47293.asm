; DESCRIPTION: Places a red 60x69 rectangle at position (136, 82).
; PLAN: r0=136(x), r1=82(y), r2=60(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 82
LDI r2, 60
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
