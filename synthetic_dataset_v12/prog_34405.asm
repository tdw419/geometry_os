; DESCRIPTION: Places a green 89x39 rectangle at position (330, 160).
; PLAN: r0=330(x), r1=160(y), r2=89(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 160
LDI r2, 89
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
