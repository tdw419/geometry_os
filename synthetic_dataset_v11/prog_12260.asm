; DESCRIPTION: Places a yellow 52x11 rectangle at position (187, 187).
; PLAN: r0=187(x), r1=187(y), r2=52(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 187
LDI r2, 52
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
