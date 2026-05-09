; DESCRIPTION: Places a yellow 91x48 rectangle at position (163, 171).
; PLAN: r0=163(x), r1=171(y), r2=91(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 171
LDI r2, 91
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
