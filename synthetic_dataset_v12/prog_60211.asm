; DESCRIPTION: Places a yellow 82x89 rectangle at position (193, 102).
; PLAN: r0=193(x), r1=102(y), r2=82(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 102
LDI r2, 82
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
