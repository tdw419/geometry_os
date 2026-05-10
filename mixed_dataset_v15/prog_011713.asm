; DESCRIPTION: Renders a cyan box of size 77x57 starting at (126, 169).
; PLAN: r0=126(x), r1=169(y), r2=77(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 169
LDI r2, 77
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
