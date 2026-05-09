; DESCRIPTION: Places a red 39x25 rectangle at position (350, 201).
; PLAN: r0=350(x), r1=201(y), r2=39(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 201
LDI r2, 39
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
