; DESCRIPTION: Draws a black rectangle at (50, 152) with width 40 and height 48.
; PLAN: r0=50(x), r1=152(y), r2=40(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 152
LDI r2, 40
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
