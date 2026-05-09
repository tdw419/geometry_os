; DESCRIPTION: Draws a cyan rectangle at (103, 147) with width 120 and height 90.
; PLAN: r0=103(x), r1=147(y), r2=120(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 147
LDI r2, 120
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
