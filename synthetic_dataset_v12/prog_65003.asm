; DESCRIPTION: Places a cyan 40x23 rectangle at position (148, 119).
; PLAN: r0=148(x), r1=119(y), r2=40(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 119
LDI r2, 40
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
