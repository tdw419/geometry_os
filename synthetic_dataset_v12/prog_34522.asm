; DESCRIPTION: Places a black 44x91 rectangle at position (169, 135).
; PLAN: r0=169(x), r1=135(y), r2=44(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 135
LDI r2, 44
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
