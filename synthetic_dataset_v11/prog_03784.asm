; DESCRIPTION: Places a blue 96x109 rectangle at position (140, 39).
; PLAN: r0=140(x), r1=39(y), r2=96(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 39
LDI r2, 96
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
