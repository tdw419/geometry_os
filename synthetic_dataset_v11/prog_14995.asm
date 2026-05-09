; DESCRIPTION: Renders a cyan box of size 47x12 starting at (56, 49).
; PLAN: r0=56(x), r1=49(y), r2=47(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 49
LDI r2, 47
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
