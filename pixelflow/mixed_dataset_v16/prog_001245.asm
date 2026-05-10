; DESCRIPTION: Renders a cyan box of size 38x21 starting at (361, 19).
; PLAN: r0=361(x), r1=19(y), r2=38(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 19
LDI r2, 38
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
