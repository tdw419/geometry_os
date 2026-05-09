; DESCRIPTION: Draws a cyan rectangle at (255, 33) with width 111 and height 48.
; PLAN: r0=255(x), r1=33(y), r2=111(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 33
LDI r2, 111
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
