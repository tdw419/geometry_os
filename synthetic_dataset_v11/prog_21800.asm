; DESCRIPTION: Places a red 65x74 rectangle at position (160, 114).
; PLAN: r0=160(x), r1=114(y), r2=65(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 114
LDI r2, 65
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
