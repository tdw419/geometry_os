; DESCRIPTION: Renders a cyan box of size 68x11 starting at (94, 92).
; PLAN: r0=94(x), r1=92(y), r2=68(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 92
LDI r2, 68
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
