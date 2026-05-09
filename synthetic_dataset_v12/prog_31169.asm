; DESCRIPTION: Places a green 71x75 rectangle at position (432, 86).
; PLAN: r0=432(x), r1=86(y), r2=71(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 86
LDI r2, 71
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
