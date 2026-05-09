; DESCRIPTION: Renders a cyan box of size 17x48 starting at (361, 169).
; PLAN: r0=361(x), r1=169(y), r2=17(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 169
LDI r2, 17
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
