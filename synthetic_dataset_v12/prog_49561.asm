; DESCRIPTION: Places a white 112x106 rectangle at position (364, 0).
; PLAN: r0=364(x), r1=0(y), r2=112(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 0
LDI r2, 112
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
