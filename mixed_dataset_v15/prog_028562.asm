; DESCRIPTION: Places a blue 106x100 rectangle at position (118, 107).
; PLAN: r0=118(x), r1=107(y), r2=106(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 107
LDI r2, 106
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
