; DESCRIPTION: Renders a cyan box of size 47x13 starting at (3, 5).
; PLAN: r0=3(x), r1=5(y), r2=47(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 5
LDI r2, 47
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
