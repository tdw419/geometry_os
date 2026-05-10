; DESCRIPTION: Places a magenta 113x56 box at position (303, 12).
; PLAN: r0=303(x), r1=12(y), r2=113(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 12
LDI r2, 113
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
