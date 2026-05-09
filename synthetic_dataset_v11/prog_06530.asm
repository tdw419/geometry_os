; DESCRIPTION: Places a yellow 94x46 rectangle at position (112, 15).
; PLAN: r0=112(x), r1=15(y), r2=94(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 15
LDI r2, 94
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
