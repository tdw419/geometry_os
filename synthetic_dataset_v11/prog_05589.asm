; DESCRIPTION: Renders a cyan box of size 47x31 starting at (126, 110).
; PLAN: r0=126(x), r1=110(y), r2=47(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 110
LDI r2, 47
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
