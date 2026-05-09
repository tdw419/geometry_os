; DESCRIPTION: Places a blue 33x58 rectangle at position (324, 146).
; PLAN: r0=324(x), r1=146(y), r2=33(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 146
LDI r2, 33
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
