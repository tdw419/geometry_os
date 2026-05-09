; DESCRIPTION: Places a magenta 98x111 rectangle at position (26, 16).
; PLAN: r0=26(x), r1=16(y), r2=98(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 16
LDI r2, 98
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
