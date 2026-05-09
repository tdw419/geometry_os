; DESCRIPTION: Creates a white rectangular region at (279, 131) spanning 75 by 98 pixels.
; PLAN: r0=279(x), r1=131(y), r2=75(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 131
LDI r2, 75
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
