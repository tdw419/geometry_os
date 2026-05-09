; DESCRIPTION: Places a cyan 12x73 rectangle at position (244, 138).
; PLAN: r0=244(x), r1=138(y), r2=12(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 138
LDI r2, 12
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
