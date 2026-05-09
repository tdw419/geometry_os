; DESCRIPTION: Places a magenta 94x46 rectangle at position (313, 15).
; PLAN: r0=313(x), r1=15(y), r2=94(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 15
LDI r2, 94
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
