; DESCRIPTION: Places a green 44x107 rectangle at position (349, 92).
; PLAN: r0=349(x), r1=92(y), r2=44(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 92
LDI r2, 44
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
