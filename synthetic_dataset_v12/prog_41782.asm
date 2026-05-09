; DESCRIPTION: Places a yellow 27x117 rectangle at position (115, 102).
; PLAN: r0=115(x), r1=102(y), r2=27(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 102
LDI r2, 27
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
