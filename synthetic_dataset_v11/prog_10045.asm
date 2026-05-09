; DESCRIPTION: Renders a cyan box of size 33x54 starting at (6, 37).
; PLAN: r0=6(x), r1=37(y), r2=33(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 37
LDI r2, 33
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
