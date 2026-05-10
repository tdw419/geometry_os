; DESCRIPTION: Places a blue 106x116 box at position (264, 42).
; PLAN: r0=264(x), r1=42(y), r2=106(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 42
LDI r2, 106
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
