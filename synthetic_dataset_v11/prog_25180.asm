; DESCRIPTION: Places a blue 39x109 rectangle at position (95, 69).
; PLAN: r0=95(x), r1=69(y), r2=39(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 69
LDI r2, 39
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
