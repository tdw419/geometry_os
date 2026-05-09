; DESCRIPTION: Draws a red rectangle at (392, 59) with width 48 and height 69.
; PLAN: r0=392(x), r1=59(y), r2=48(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 59
LDI r2, 48
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
