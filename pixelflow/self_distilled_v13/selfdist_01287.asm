; DESCRIPTION: Places a magenta 50x104 box at position (221, 193).
; PLAN: r0=221(x), r1=193(y), r2=50(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 193
LDI r2, 50
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
