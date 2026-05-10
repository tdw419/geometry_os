; DESCRIPTION: Renders a cyan box of size 81x91 starting at (200, 94).
; PLAN: r0=200(x), r1=94(y), r2=81(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 94
LDI r2, 81
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
