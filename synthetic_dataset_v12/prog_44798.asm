; DESCRIPTION: Draws a white rectangle at (242, 87) with width 93 and height 103.
; PLAN: r0=242(x), r1=87(y), r2=93(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 87
LDI r2, 93
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
