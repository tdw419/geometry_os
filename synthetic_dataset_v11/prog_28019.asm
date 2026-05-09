; DESCRIPTION: Places a yellow 70x91 rectangle at position (167, 140).
; PLAN: r0=167(x), r1=140(y), r2=70(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 140
LDI r2, 70
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
