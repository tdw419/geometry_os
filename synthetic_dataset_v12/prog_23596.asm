; DESCRIPTION: Places a magenta 107x97 rectangle at position (271, 80).
; PLAN: r0=271(x), r1=80(y), r2=107(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 80
LDI r2, 107
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
