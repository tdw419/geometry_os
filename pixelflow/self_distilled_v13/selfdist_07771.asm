; DESCRIPTION: Places a yellow 82x34 box at position (362, 48).
; PLAN: r0=362(x), r1=48(y), r2=82(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 48
LDI r2, 82
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
