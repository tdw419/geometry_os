; DESCRIPTION: Draws a cyan rectangle at (502, 25) with width 10 and height 28.
; PLAN: r0=502(x), r1=25(y), r2=10(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 25
LDI r2, 10
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
