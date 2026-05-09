; DESCRIPTION: Places a yellow 37x57 rectangle at position (40, 134).
; PLAN: r0=40(x), r1=134(y), r2=37(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 134
LDI r2, 37
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
