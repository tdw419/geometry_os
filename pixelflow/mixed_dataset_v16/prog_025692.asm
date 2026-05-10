; DESCRIPTION: Places a yellow 57x74 box at position (290, 153).
; PLAN: r0=290(x), r1=153(y), r2=57(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 153
LDI r2, 57
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
