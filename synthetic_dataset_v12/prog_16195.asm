; DESCRIPTION: Places a magenta 94x17 rectangle at position (243, 199).
; PLAN: r0=243(x), r1=199(y), r2=94(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 199
LDI r2, 94
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
