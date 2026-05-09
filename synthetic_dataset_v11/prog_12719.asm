; DESCRIPTION: Places a green 15x76 rectangle at position (177, 51).
; PLAN: r0=177(x), r1=51(y), r2=15(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 51
LDI r2, 15
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
