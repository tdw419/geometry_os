; DESCRIPTION: Places a purple 41x44 rectangle at position (444, 8).
; PLAN: r0=444(x), r1=8(y), r2=41(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 8
LDI r2, 41
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
