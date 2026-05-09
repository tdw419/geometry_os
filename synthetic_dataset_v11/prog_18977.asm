; DESCRIPTION: Renders a cyan box of size 36x20 starting at (57, 17).
; PLAN: r0=57(x), r1=17(y), r2=36(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 17
LDI r2, 36
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
