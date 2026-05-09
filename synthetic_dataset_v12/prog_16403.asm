; DESCRIPTION: Places a magenta 106x19 rectangle at position (300, 150).
; PLAN: r0=300(x), r1=150(y), r2=106(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 150
LDI r2, 106
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
