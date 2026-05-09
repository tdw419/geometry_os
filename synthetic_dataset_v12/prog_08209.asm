; DESCRIPTION: Places a blue 61x46 rectangle at position (11, 80).
; PLAN: r0=11(x), r1=80(y), r2=61(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 80
LDI r2, 61
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
