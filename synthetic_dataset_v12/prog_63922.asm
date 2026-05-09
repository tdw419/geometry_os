; DESCRIPTION: Places a blue 24x34 rectangle at position (428, 209).
; PLAN: r0=428(x), r1=209(y), r2=24(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 209
LDI r2, 24
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
