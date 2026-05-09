; DESCRIPTION: Places a cyan 91x73 rectangle at position (170, 140).
; PLAN: r0=170(x), r1=140(y), r2=91(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 140
LDI r2, 91
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
