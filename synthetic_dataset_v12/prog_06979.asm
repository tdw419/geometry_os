; DESCRIPTION: Places a yellow 21x120 rectangle at position (130, 58).
; PLAN: r0=130(x), r1=58(y), r2=21(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 58
LDI r2, 21
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
