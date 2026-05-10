; DESCRIPTION: Draws a cyan rectangle at (264, 129) with width 40 and height 120.
; PLAN: r0=264(x), r1=129(y), r2=40(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 129
LDI r2, 40
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
