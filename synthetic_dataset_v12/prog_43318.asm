; DESCRIPTION: Places a green 48x99 rectangle at position (185, 101).
; PLAN: r0=185(x), r1=101(y), r2=48(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 101
LDI r2, 48
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
