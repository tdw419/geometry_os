; DESCRIPTION: Places a magenta 114x42 rectangle at position (260, 51).
; PLAN: r0=260(x), r1=51(y), r2=114(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 51
LDI r2, 114
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
