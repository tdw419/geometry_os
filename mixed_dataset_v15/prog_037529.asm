; DESCRIPTION: Renders a cyan box of size 47x66 starting at (179, 161).
; PLAN: r0=179(x), r1=161(y), r2=47(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 161
LDI r2, 47
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
