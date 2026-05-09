; DESCRIPTION: Draws a cyan rectangle at (413, 28) with width 90 and height 93.
; PLAN: r0=413(x), r1=28(y), r2=90(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 28
LDI r2, 90
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
