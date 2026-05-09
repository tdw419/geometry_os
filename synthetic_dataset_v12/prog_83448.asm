; DESCRIPTION: Places a magenta 75x109 rectangle at position (241, 14).
; PLAN: r0=241(x), r1=14(y), r2=75(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 14
LDI r2, 75
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
