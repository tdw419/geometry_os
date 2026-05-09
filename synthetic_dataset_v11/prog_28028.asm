; DESCRIPTION: Renders a cyan box of size 68x94 starting at (70, 157).
; PLAN: r0=70(x), r1=157(y), r2=68(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 157
LDI r2, 68
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
