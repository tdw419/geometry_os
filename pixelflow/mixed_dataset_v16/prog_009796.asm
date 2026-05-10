; DESCRIPTION: Draws a cyan rectangle at (290, 120) with width 117 and height 107.
; PLAN: r0=290(x), r1=120(y), r2=117(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 120
LDI r2, 117
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
