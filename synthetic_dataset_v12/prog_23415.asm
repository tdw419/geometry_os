; DESCRIPTION: Places a red circle of radius 16 at center (344, 160).
; PLAN: r0=344(x), r1=160(y), r2=16(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 344
LDI r1, 160
LDI r2, 16
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
