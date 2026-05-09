; DESCRIPTION: Draws a cyan rectangle at (403, 124) with width 58 and height 63.
; PLAN: r0=403(x), r1=124(y), r2=58(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 124
LDI r2, 58
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
