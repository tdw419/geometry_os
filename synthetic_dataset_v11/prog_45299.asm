; DESCRIPTION: Places a red 60x51 rectangle at position (177, 46).
; PLAN: r0=177(x), r1=46(y), r2=60(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 46
LDI r2, 60
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
