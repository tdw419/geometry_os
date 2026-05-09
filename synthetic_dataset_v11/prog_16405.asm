; DESCRIPTION: Draws a cyan rectangle at (224, 19) with width 24 and height 120.
; PLAN: r0=224(x), r1=19(y), r2=24(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 19
LDI r2, 24
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
