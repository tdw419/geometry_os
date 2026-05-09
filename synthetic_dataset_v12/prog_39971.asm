; DESCRIPTION: Renders a green box of size 94x60 starting at (344, 104).
; PLAN: r0=344(x), r1=104(y), r2=94(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 104
LDI r2, 94
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
