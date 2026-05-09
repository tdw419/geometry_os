; DESCRIPTION: Places a black 48x34 rectangle at position (109, 34).
; PLAN: r0=109(x), r1=34(y), r2=48(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 34
LDI r2, 48
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
