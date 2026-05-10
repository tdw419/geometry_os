; DESCRIPTION: Places a yellow 108x25 box at position (217, 193).
; PLAN: r0=217(x), r1=193(y), r2=108(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 193
LDI r2, 108
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
