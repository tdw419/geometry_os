; DESCRIPTION: Places a purple 44x46 rectangle at position (246, 86).
; PLAN: r0=246(x), r1=86(y), r2=44(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 86
LDI r2, 44
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
