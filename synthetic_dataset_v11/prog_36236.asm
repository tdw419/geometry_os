; DESCRIPTION: Draws a cyan rectangle at (34, 186) with width 32 and height 53.
; PLAN: r0=34(x), r1=186(y), r2=32(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 186
LDI r2, 32
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
