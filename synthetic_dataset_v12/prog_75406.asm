; DESCRIPTION: Places a purple 23x44 rectangle at position (70, 113).
; PLAN: r0=70(x), r1=113(y), r2=23(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 113
LDI r2, 23
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
