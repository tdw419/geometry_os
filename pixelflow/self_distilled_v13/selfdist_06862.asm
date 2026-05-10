; DESCRIPTION: Places a cyan 71x19 box at position (318, 167).
; PLAN: r0=318(x), r1=167(y), r2=71(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 167
LDI r2, 71
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
