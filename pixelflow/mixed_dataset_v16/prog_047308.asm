; DESCRIPTION: Creates a red rectangular region at (363, 131) spanning 80 by 117 pixels.
; PLAN: r0=363(x), r1=131(y), r2=80(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 131
LDI r2, 80
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
