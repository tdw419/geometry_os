; DESCRIPTION: Places a magenta 19x10 rectangle at position (146, 44).
; PLAN: r0=146(x), r1=44(y), r2=19(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 44
LDI r2, 19
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
