; DESCRIPTION: Draws a cyan rectangle at (374, 129) with width 23 and height 76.
; PLAN: r0=374(x), r1=129(y), r2=23(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 129
LDI r2, 23
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
