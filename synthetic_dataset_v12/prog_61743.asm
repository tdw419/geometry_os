; DESCRIPTION: Places a yellow 66x45 rectangle at position (119, 71).
; PLAN: r0=119(x), r1=71(y), r2=66(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 71
LDI r2, 66
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
