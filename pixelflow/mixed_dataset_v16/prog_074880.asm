; DESCRIPTION: Renders a cyan box of size 45x97 starting at (366, 12).
; PLAN: r0=366(x), r1=12(y), r2=45(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 12
LDI r2, 45
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
