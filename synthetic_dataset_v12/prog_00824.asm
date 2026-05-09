; DESCRIPTION: Places a yellow 57x65 rectangle at position (306, 134).
; PLAN: r0=306(x), r1=134(y), r2=57(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 134
LDI r2, 57
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
