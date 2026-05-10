; DESCRIPTION: Draws a cyan rectangle at (446, 126) with width 47 and height 71.
; PLAN: r0=446(x), r1=126(y), r2=47(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 126
LDI r2, 47
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
