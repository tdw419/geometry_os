; DESCRIPTION: Renders a cyan box of size 45x110 starting at (56, 86).
; PLAN: r0=56(x), r1=86(y), r2=45(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 86
LDI r2, 45
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
