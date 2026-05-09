; DESCRIPTION: Places a magenta 106x106 rectangle at position (32, 107).
; PLAN: r0=32(x), r1=107(y), r2=106(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 107
LDI r2, 106
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
