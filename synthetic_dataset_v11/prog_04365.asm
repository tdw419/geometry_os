; DESCRIPTION: Places a yellow 72x93 rectangle at position (153, 91).
; PLAN: r0=153(x), r1=91(y), r2=72(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 91
LDI r2, 72
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
