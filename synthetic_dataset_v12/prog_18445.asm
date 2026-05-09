; DESCRIPTION: Places a green 74x46 rectangle at position (315, 140).
; PLAN: r0=315(x), r1=140(y), r2=74(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 140
LDI r2, 74
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
