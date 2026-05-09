; DESCRIPTION: Places a magenta 98x97 rectangle at position (23, 65).
; PLAN: r0=23(x), r1=65(y), r2=98(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 65
LDI r2, 98
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
