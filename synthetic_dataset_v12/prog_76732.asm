; DESCRIPTION: Places a yellow 95x46 rectangle at position (56, 187).
; PLAN: r0=56(x), r1=187(y), r2=95(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 187
LDI r2, 95
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
