; DESCRIPTION: Places a purple 44x75 rectangle at position (243, 86).
; PLAN: r0=243(x), r1=86(y), r2=44(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 86
LDI r2, 44
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
