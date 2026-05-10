; DESCRIPTION: Places a magenta 111x82 box at position (70, 198).
; PLAN: r0=70(x), r1=198(y), r2=111(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 198
LDI r2, 111
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
