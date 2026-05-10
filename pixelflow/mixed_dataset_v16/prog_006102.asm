; DESCRIPTION: Places a red 37x20 box at position (369, 55).
; PLAN: r0=369(x), r1=55(y), r2=37(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 55
LDI r2, 37
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
