; DESCRIPTION: Places a purple 46x44 rectangle at position (391, 168).
; PLAN: r0=391(x), r1=168(y), r2=46(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 168
LDI r2, 46
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
