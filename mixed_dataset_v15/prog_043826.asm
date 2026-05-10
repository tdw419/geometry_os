; DESCRIPTION: Renders a cyan box of size 73x19 starting at (205, 160).
; PLAN: r0=205(x), r1=160(y), r2=73(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 160
LDI r2, 73
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
