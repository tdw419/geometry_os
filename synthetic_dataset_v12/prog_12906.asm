; DESCRIPTION: Places a magenta 107x45 rectangle at position (88, 202).
; PLAN: r0=88(x), r1=202(y), r2=107(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 202
LDI r2, 107
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
