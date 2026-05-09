; DESCRIPTION: Places a green 113x21 rectangle at position (51, 149).
; PLAN: r0=51(x), r1=149(y), r2=113(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 149
LDI r2, 113
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
