; DESCRIPTION: Places a magenta 83x99 rectangle at position (229, 17).
; PLAN: r0=229(x), r1=17(y), r2=83(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 17
LDI r2, 83
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
