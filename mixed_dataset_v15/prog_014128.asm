; DESCRIPTION: Places a magenta 18x117 rectangle at position (87, 28).
; PLAN: r0=87(x), r1=28(y), r2=18(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 28
LDI r2, 18
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
