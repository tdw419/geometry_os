; DESCRIPTION: Places a yellow 57x80 rectangle at position (306, 86).
; PLAN: r0=306(x), r1=86(y), r2=57(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 86
LDI r2, 57
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
