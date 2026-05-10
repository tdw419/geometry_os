; DESCRIPTION: Places a yellow 72x48 rectangle at position (261, 66).
; PLAN: r0=261(x), r1=66(y), r2=72(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 66
LDI r2, 72
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
