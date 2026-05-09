; DESCRIPTION: Renders a cyan box of size 36x52 starting at (361, 37).
; PLAN: r0=361(x), r1=37(y), r2=36(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 37
LDI r2, 36
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
