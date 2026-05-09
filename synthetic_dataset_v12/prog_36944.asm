; DESCRIPTION: Places a cyan 22x108 rectangle at position (429, 138).
; PLAN: r0=429(x), r1=138(y), r2=22(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 138
LDI r2, 22
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
