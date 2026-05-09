; DESCRIPTION: Draws a cyan rectangle at (271, 130) with width 57 and height 50.
; PLAN: r0=271(x), r1=130(y), r2=57(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 130
LDI r2, 57
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
