; DESCRIPTION: Places a green 91x69 rectangle at position (51, 117).
; PLAN: r0=51(x), r1=117(y), r2=91(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 117
LDI r2, 91
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
