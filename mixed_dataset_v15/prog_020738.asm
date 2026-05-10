; DESCRIPTION: Places a purple 109x27 box at position (290, 115).
; PLAN: r0=290(x), r1=115(y), r2=109(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 115
LDI r2, 109
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
