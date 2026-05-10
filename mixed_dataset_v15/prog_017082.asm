; DESCRIPTION: Draws a cyan rectangle at (330, 129) with width 74 and height 52.
; PLAN: r0=330(x), r1=129(y), r2=74(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 129
LDI r2, 74
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
