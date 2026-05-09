; DESCRIPTION: Places a magenta 17x25 rectangle at position (195, 178).
; PLAN: r0=195(x), r1=178(y), r2=17(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 178
LDI r2, 17
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
