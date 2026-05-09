; DESCRIPTION: Places a magenta 21x17 rectangle at position (106, 164).
; PLAN: r0=106(x), r1=164(y), r2=21(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 164
LDI r2, 21
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
