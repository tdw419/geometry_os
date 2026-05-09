; DESCRIPTION: Places a yellow 93x17 rectangle at position (127, 70).
; PLAN: r0=127(x), r1=70(y), r2=93(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 70
LDI r2, 93
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
