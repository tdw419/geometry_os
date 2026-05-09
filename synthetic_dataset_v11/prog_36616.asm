; DESCRIPTION: Renders a white box of size 27x115 starting at (110, 104).
; PLAN: r0=110(x), r1=104(y), r2=27(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 104
LDI r2, 27
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
