; DESCRIPTION: Places a magenta 46x49 box at position (397, 98).
; PLAN: r0=397(x), r1=98(y), r2=46(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 98
LDI r2, 46
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
