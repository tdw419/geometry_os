; DESCRIPTION: Places a yellow 93x47 box at position (188, 19).
; PLAN: r0=188(x), r1=19(y), r2=93(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 19
LDI r2, 93
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
