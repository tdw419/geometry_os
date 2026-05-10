; DESCRIPTION: Places a yellow 57x21 box at position (400, 129).
; PLAN: r0=400(x), r1=129(y), r2=57(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 129
LDI r2, 57
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
