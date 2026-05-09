; DESCRIPTION: Renders a cyan box of size 52x83 starting at (338, 46).
; PLAN: r0=338(x), r1=46(y), r2=52(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 46
LDI r2, 52
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
