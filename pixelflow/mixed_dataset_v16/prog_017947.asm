; DESCRIPTION: Renders a cyan box of size 11x63 starting at (298, 115).
; PLAN: r0=298(x), r1=115(y), r2=11(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 115
LDI r2, 11
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
