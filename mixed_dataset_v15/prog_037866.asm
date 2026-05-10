; DESCRIPTION: Draws a red rectangle at (353, 180) with width 64 and height 48.
; PLAN: r0=353(x), r1=180(y), r2=64(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 180
LDI r2, 64
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
