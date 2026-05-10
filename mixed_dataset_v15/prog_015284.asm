; DESCRIPTION: Draws a cyan rectangle at (435, 58) with width 54 and height 82.
; PLAN: r0=435(x), r1=58(y), r2=54(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 58
LDI r2, 54
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
