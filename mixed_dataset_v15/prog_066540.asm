; DESCRIPTION: Places a magenta 33x50 box at position (315, 11).
; PLAN: r0=315(x), r1=11(y), r2=33(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 11
LDI r2, 33
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
