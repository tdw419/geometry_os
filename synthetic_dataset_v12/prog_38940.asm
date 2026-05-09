; DESCRIPTION: Places a cyan 23x99 rectangle at position (294, 118).
; PLAN: r0=294(x), r1=118(y), r2=23(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 118
LDI r2, 23
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
