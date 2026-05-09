; DESCRIPTION: Places a green 109x51 rectangle at position (374, 156).
; PLAN: r0=374(x), r1=156(y), r2=109(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 156
LDI r2, 109
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
