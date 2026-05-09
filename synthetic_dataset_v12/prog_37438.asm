; DESCRIPTION: Renders a cyan box of size 91x11 starting at (213, 131).
; PLAN: r0=213(x), r1=131(y), r2=91(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 131
LDI r2, 91
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
