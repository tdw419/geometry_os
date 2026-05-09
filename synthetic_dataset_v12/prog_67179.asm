; DESCRIPTION: Draws a cyan rectangle at (394, 70) with width 111 and height 77.
; PLAN: r0=394(x), r1=70(y), r2=111(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 70
LDI r2, 111
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
