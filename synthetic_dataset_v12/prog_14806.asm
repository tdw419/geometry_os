; DESCRIPTION: Places a green 48x66 rectangle at position (174, 85).
; PLAN: r0=174(x), r1=85(y), r2=48(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 85
LDI r2, 48
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
