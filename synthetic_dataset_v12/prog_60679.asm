; DESCRIPTION: Places a blue 106x112 rectangle at position (370, 60).
; PLAN: r0=370(x), r1=60(y), r2=106(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 60
LDI r2, 106
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
