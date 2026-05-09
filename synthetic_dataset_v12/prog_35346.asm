; DESCRIPTION: Places a cyan 23x93 rectangle at position (135, 138).
; PLAN: r0=135(x), r1=138(y), r2=23(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 138
LDI r2, 23
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
