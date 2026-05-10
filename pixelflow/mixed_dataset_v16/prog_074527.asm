; DESCRIPTION: Places a green 109x39 box at position (362, 136).
; PLAN: r0=362(x), r1=136(y), r2=109(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 136
LDI r2, 109
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
