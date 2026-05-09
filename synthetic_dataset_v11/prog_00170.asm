; DESCRIPTION: Places a green 107x72 rectangle at position (24, 119).
; PLAN: r0=24(x), r1=119(y), r2=107(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 119
LDI r2, 107
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
