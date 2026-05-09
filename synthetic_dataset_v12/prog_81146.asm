; DESCRIPTION: Places a blue 46x33 rectangle at position (317, 165).
; PLAN: r0=317(x), r1=165(y), r2=46(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 165
LDI r2, 46
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
