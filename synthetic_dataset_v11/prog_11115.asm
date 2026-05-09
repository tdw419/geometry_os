; DESCRIPTION: Places a magenta 107x83 rectangle at position (116, 164).
; PLAN: r0=116(x), r1=164(y), r2=107(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 164
LDI r2, 107
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
