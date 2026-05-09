; DESCRIPTION: Places a yellow 29x25 rectangle at position (276, 209).
; PLAN: r0=276(x), r1=209(y), r2=29(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 209
LDI r2, 29
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
