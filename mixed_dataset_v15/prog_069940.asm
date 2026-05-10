; DESCRIPTION: Places a magenta 83x111 box at position (364, 39).
; PLAN: r0=364(x), r1=39(y), r2=83(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 39
LDI r2, 83
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
