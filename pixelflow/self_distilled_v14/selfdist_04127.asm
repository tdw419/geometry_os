; DESCRIPTION: Places a green 119x93 box at position (65, 174).
; PLAN: r0=65(x), r1=174(y), r2=119(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 174
LDI r2, 119
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
