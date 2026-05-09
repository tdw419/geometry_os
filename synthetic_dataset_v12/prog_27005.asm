; DESCRIPTION: Places a magenta 91x85 rectangle at position (151, 160).
; PLAN: r0=151(x), r1=160(y), r2=91(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 160
LDI r2, 91
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
