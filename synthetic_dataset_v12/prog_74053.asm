; DESCRIPTION: Renders a cyan box of size 25x75 starting at (325, 14).
; PLAN: r0=325(x), r1=14(y), r2=25(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 14
LDI r2, 25
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
