; DESCRIPTION: Places a yellow 67x107 box at position (243, 157).
; PLAN: r0=243(x), r1=157(y), r2=67(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 157
LDI r2, 67
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
