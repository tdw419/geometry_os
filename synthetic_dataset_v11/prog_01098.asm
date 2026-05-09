; DESCRIPTION: Places a blue 23x120 rectangle at position (171, 46).
; PLAN: r0=171(x), r1=46(y), r2=23(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 46
LDI r2, 23
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
