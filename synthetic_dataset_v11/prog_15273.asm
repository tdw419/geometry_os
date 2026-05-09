; DESCRIPTION: Places a green 48x31 rectangle at position (51, 34).
; PLAN: r0=51(x), r1=34(y), r2=48(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 34
LDI r2, 48
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
