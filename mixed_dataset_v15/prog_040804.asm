; DESCRIPTION: Places a white 70x29 box at position (20, 169).
; PLAN: r0=20(x), r1=169(y), r2=70(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 169
LDI r2, 70
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
