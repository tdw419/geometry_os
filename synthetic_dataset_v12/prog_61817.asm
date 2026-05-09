; DESCRIPTION: Draws a cyan rectangle at (92, 71) with width 27 and height 82.
; PLAN: r0=92(x), r1=71(y), r2=27(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 71
LDI r2, 27
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
