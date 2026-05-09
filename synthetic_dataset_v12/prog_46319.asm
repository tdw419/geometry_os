; DESCRIPTION: Places a blue 120x99 rectangle at position (248, 7).
; PLAN: r0=248(x), r1=7(y), r2=120(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 7
LDI r2, 120
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
