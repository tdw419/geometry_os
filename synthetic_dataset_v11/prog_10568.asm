; DESCRIPTION: Draws a cyan rectangle at (105, 47) with width 120 and height 44.
; PLAN: r0=105(x), r1=47(y), r2=120(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 47
LDI r2, 120
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
