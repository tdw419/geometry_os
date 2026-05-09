; DESCRIPTION: Places a yellow 30x34 rectangle at position (46, 6).
; PLAN: r0=46(x), r1=6(y), r2=30(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 6
LDI r2, 30
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
