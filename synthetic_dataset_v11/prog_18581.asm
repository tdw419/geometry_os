; DESCRIPTION: Places a yellow 98x44 rectangle at position (71, 94).
; PLAN: r0=71(x), r1=94(y), r2=98(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 94
LDI r2, 98
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
