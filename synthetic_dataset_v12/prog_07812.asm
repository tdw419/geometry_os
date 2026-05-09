; DESCRIPTION: Draws a white rectangle at (46, 154) with width 109 and height 16.
; PLAN: r0=46(x), r1=154(y), r2=109(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 154
LDI r2, 109
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
