; DESCRIPTION: Renders a cyan box of size 118x87 starting at (54, 33).
; PLAN: r0=54(x), r1=33(y), r2=118(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 33
LDI r2, 118
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
