; DESCRIPTION: Places a yellow 34x24 rectangle at position (51, 37).
; PLAN: r0=51(x), r1=37(y), r2=34(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 37
LDI r2, 34
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
