; DESCRIPTION: Places a blue 33x90 rectangle at position (212, 54).
; PLAN: r0=212(x), r1=54(y), r2=33(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 54
LDI r2, 33
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
