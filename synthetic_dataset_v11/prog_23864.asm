; DESCRIPTION: Draws a cyan rectangle at (34, 93) with width 111 and height 40.
; PLAN: r0=34(x), r1=93(y), r2=111(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 93
LDI r2, 111
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
