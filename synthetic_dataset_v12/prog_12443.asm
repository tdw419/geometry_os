; DESCRIPTION: Places a yellow 18x18 rectangle at position (271, 11).
; PLAN: r0=271(x), r1=11(y), r2=18(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 11
LDI r2, 18
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
