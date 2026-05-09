; DESCRIPTION: Places a cyan 91x19 rectangle at position (21, 118).
; PLAN: r0=21(x), r1=118(y), r2=91(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 118
LDI r2, 91
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
